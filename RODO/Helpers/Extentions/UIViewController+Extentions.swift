//
//  UIViewController+Extentions.swift

//
//  Created by NIshit Patel on 8/23/23.
//

import UIKit
extension UIViewController
{
    func showErrorAlert(message: String)
    {
        let alertView = UIAlertController(title: "Error!",
                                          message: message,
                                          preferredStyle: .alert)
        
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        
        alertView.addAction(okayAction)
        
        self.present(alertView, animated: true, completion: nil)
    }
}
