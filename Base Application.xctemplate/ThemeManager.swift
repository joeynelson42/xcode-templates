
import Foundation

public struct Theme {
    public var primaryColor: UIColor!
    public var secondaryColor: UIColor!
    public var accentColor: UIColor!
    
    public init(primaryColor: UIColor, secondaryColor: UIColor, accentColor: UIColor) {
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
        self.accentColor = accentColor
    }
}

public class ThemeManager {
    
    public static let main = ThemeManager()
    
    private var currentTheme: Theme!
    
    public init() {
        currentTheme = Theme(primaryColor: .white, secondaryColor: .white, accentColor: .white)
    }
    
    public init(theme: Theme) {
        self.currentTheme = theme
    }
    
    public func setTheme(theme: Theme) {
        self.currentTheme = theme
    }
    
    public var primaryColor: UIColor {
        get {
            return currentTheme.primaryColor
        }
    }
    
    public var secondaryColor: UIColor {
        get {
            return currentTheme.secondaryColor
        }
    }
    
    public var accentColor: UIColor {
        get {
            return currentTheme.accentColor
        }
    }
}
