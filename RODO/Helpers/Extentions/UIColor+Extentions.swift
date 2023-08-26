//
//  UIColor+Extentions.swift

//
//  Created by NIshit Patel on 8/23/23.
//

import UIKit

extension UIColor{
    
    static let appLightGreen: UIColor               = UIColor(named: "AppLightGreen")!
    static let appDarkGreen: UIColor               = UIColor(named: "AppDarkGreen")!
    
    static func fromHex(_ hex: String?) -> UIColor{
        
        let hex = hex ?? "000000"
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if cString.count != 6 {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: 1.0
        )
    }
}
