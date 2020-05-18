//  Copyright (c) 2015 SEEK Limited. All rights reserved.
//

import Foundation

public extension UIColor {
    // appropriated from http://stackoverflow.com/questions/24263007/how-to-use-hex-colour-values-in-swift-ios
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
    convenience init?(hexString: String) {
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        self.init(netHex: Int(color))
    }
    
    func toHexString() -> String {
       let r: CGFloat = cgColor.components?[0] ?? 0
       let g: CGFloat = cgColor.components?[1] ?? 0
       let b: CGFloat = cgColor.components?[2] ?? 0
       return String(format: "#%02lX%02lX%02lX", lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)))
    }
    
    func resolvedColor(for style: UIUserInterfaceStyle) -> UIColor {
        if #available(iOS 13.0, *) {
            return resolvedColor(with: .init(userInterfaceStyle: style))
        } else {
            return self
        }
    }
}
