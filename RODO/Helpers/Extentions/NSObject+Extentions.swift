//
//  NSObject+Extentions.swift

//
//  Created by NIshit Patel on 8/23/23.
//

import Foundation

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
