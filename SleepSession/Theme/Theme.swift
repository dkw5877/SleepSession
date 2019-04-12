
import UIKit.UIColor

final class Theme {
    
    static var darkPurple:UIColor {
        return UIColor(red: 44/255, green: 26/255, blue: 74/255, alpha: 1.0)
    }
    
    static var mediumPurple:UIColor {
        return UIColor(red: 58/255, green: 27/255, blue: 107/255, alpha: 0.6)
    }
    
    static var appPurple:UIColor {
        return UIColor(red: 97/255, green: 43/255, blue: 166/255, alpha: 1.0)
    }
    
    static var activePurple:UIColor {
        return UIColor(red: 101/255, green: 43/255, blue: 167/255, alpha: 1.0)
    }
    
    static var lightPurple:UIColor {
        return UIColor(red: 105/255, green: 109/255, blue: 179/255, alpha: 1.0)
    }
    
    static var textPurple:UIColor {
        return UIColor(red: 147/255, green: 128/255, blue: 184/255, alpha: 1.0)
    }
    
    static var trackDark:UIColor {
        return UIColor(red: 55/255, green: 36/255, blue: 98/255, alpha: 1.0)
    }
    
    static var trackMedium:UIColor {
        return UIColor(red: 75/255, green: 33/255, blue: 98/255, alpha: 1.0)
    }
    
    static var white:UIColor {
        return UIColor.white
    }
    
    static var titleFont: UIFont {
        return UIFont(name: "Helvetica", size: 16)!
    }
    
    static var titleBoldFont: UIFont {
        return UIFont(name: "Helvetica-Bold", size: 16)!
    }
    
    static var bodyFont: UIFont {
        return UIFont(name: "Helvetica", size: 14)!
    }
    
    static var barStyle: UIBarStyle {
        return .default
    }
    
    class func apply() {
        
        // MARK: UINavigationBar
        UINavigationBar.appearance().barStyle = barStyle
        UINavigationBar.appearance().tintColor = appPurple
        UINavigationBar.appearance().barTintColor = white
    }
}
