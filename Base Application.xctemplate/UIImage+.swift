//
//  UIImage+Shared.swift
//  ImpactSharedFramework
//
//  Created by Joey Nelson on 3/29/18.
//  Copyright © 2018 impact. All rights reserved.
//

import Foundation

public extension UIImage {
    
    public func tinted(color:UIColor) -> UIImage? {
        let image = self
        let rect:CGRect = CGRect(origin: CGPoint(x: 0, y: 0), size: image.size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, image.scale)
        let context = UIGraphicsGetCurrentContext()!
        image.draw(in: rect)
        context.setFillColor(color.cgColor)
        context.setBlendMode(.sourceAtop)
        context.fill(rect)
        if let result:UIImage = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()
            return result
        }
        else {
            return nil
        }
    }
    
    public func getPixelColor(point: CGPoint) -> UIColor? {
        if point.x < 0 || point.x > size.width || point.y < 0 || point.y > size.height {
            return nil
        }
        
        guard let cgImg = self.cgImage else { return nil }
        guard let provider = cgImg.dataProvider else { return nil }
        guard let providerData = provider.data else { return nil }
        guard let data = CFDataGetBytePtr(providerData) else { return nil }
        
        let numberOfComponents = 4
        let pixelData = Int((size.width * point.y) + point.x) * numberOfComponents
        let r = CGFloat(data[pixelData]) / 255.0
        let g = CGFloat(data[pixelData + 1]) / 255.0
        let b = CGFloat(data[pixelData + 2]) / 255.0
        let a = CGFloat(data[pixelData + 3]) / 255.0
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}
