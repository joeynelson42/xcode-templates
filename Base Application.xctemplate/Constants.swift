//
//  Constants.swift
//

import UIKit

struct Constants {
    
    struct Metrics {
        static let screenWidth = UIScreen.main.bounds.width
        static let screenHeight = UIScreen.main.bounds.height
    }
    
    struct Keys {
        
    }
    
    struct Urls {
        
    }
    
    struct Fonts {
        static func printFontNames() {
            UIFont.familyNames.sorted().forEach({ (familyName) in
                debugPrint(UIFont.fontNames(forFamilyName: familyName))
            })
        }
    }
}

