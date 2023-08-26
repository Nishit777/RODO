//
//  Extentions.swift
//
//

//  Copyright © 2023 NKP. All rights reserved.
//

import UIKit

//MARK: UIView
extension UIView {
    func makeCircleView() {
        let radius = min(self.frame.size.width, self.frame.size.height)
        self.roundedCorner(radius/2)
    }
    
    func roundedCorner(_ value: CGFloat = 3) {
        
        var radius = value
        if self.frame.size.height != 0
        {
            // If frame is not equal to zero, we need to apply minimum Rounded corner from 2 factors.
            radius = min(value, self.frame.size.height/2)
        }
        
        layer.cornerRadius = radius
        clipsToBounds = true
    }
    
    func tapAnimation(completion: (() -> ())? = nil){
        
        UIView.animate(withDuration: 0.1, delay: 0, options: [.curveEaseOut], animations: {
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { finished in
            UIView.animate(withDuration: 0.1, delay: 0, options: [.curveEaseIn], animations: {
                
                self.transform = CGAffineTransform.identity
            }) { _ in
                
                completion?()
            }
        }
    }
    
    func addBorder(_ color: UIColor, _ width:CGFloat = 1)
    {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
}

