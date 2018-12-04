//
//  String+Shared.swift
//  ImpactSharedFramework
//
//  Created by Joey Nelson on 3/26/18.
//  Copyright © 2018 impact. All rights reserved.
//

import Foundation

public extension String {
    
    public func slice(from: String, to: String) -> String? {
        
        return (range(of: from)?.upperBound).flatMap { substringFrom in
            (range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
                String(self[substringFrom..<substringTo])
            }
        }
    }
    
    public func isAlphanumeric() -> Bool {
        return self.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil && self != ""
    }
    
    public var htmlToAttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: Data(utf8), options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html, NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return nil
        }
    }
    
    public var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
    public func fontSizeWithFont(font: UIFont, constrainedToSize size: CGSize, minimumScaleFactor: CGFloat) -> CGFloat {
        var fontSize = font.pointSize
        let minimumFontSize = fontSize * minimumScaleFactor
        
        var attributedText = NSAttributedString(string: self as String, attributes:[NSAttributedStringKey.font: font])
        var height = attributedText.boundingRect(with: CGSize(width: size.width, height: CGFloat.greatestFiniteMagnitude), options:NSStringDrawingOptions.usesLineFragmentOrigin, context:nil).size.height
        
        var newFont = font
        //Reduce font size while too large, break if no height (empty string)
        while (height > size.height && height != 0 && fontSize > minimumFontSize) {
            fontSize -= 1;
            newFont = UIFont(name: font.fontName, size: fontSize)!
            
            attributedText = NSAttributedString(string: self as String, attributes:[NSAttributedStringKey.font: newFont])
            height = attributedText.boundingRect(with: CGSize(width: size.width, height: CGFloat.greatestFiniteMagnitude), options:NSStringDrawingOptions.usesLineFragmentOrigin, context:nil).size.height
        }
        
        // Loop through words in string and resize to fit
        for word in self.components(separatedBy: NSCharacterSet.whitespacesAndNewlines) {
            var width = word.size(withAttributes: [NSAttributedStringKey.font:newFont]).width
            while (width > size.width && width != 0 && fontSize > minimumFontSize) {
                fontSize -= 1
                newFont = UIFont(name: font.fontName, size: fontSize)!
                width = word.size(withAttributes: [NSAttributedStringKey.font:newFont]).width
            }
        }
        return fontSize;
    }
    
    public func commify() -> String {
        guard let int = Int(self) else { return "" }
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: int)) ?? ""
    }
    
    func ranges(of substring: String, options: CompareOptions = [], locale: Locale? = nil) -> [Range<Index>] {
        var ranges: [Range<Index>] = []
        while let range = self.lowercased().range(of: substring.lowercased(), options: options, range: (ranges.last?.upperBound ?? self.startIndex)..<self.endIndex, locale: locale) {
            ranges.append(range)
        }
        return ranges
    }
    
    func textChunk(includingWord word: String) -> String {
        let words = self.components(separatedBy: " ")
        var index: Int!
        for (i,wor) in words.enumerated() {
            if wor.lowercased().contains(word) {
                index = i
                break
            }
        }
        
        guard let wordIndex = index else {
            return ""
        }
        
        var chunk = "..."
        if words.count < 30 {
            chunk = self
        } else if wordIndex < 15 {
            chunk = self
        } else if words.count - wordIndex < 30 {
            let reduced = words[wordIndex...words.count - 1]
            chunk.append(reduced.joined(separator: " "))
        } else {
            let reduced = words[wordIndex - 15...words.count - 1]
            chunk.append(reduced.joined(separator: " "))
            chunk.append("...")
        }
        
        return chunk
    }
    
    static func matches(for regex: String, in text: String) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
    static func randomString(withLength length: Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
}
