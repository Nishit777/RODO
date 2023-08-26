//
//  String+Extention.swift

//
//  Created by NIshit Patel on 8/23/23.
//

import UIKit

extension String
{
    func attributedText(boldString: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self,
                                                         attributes: [.font: UIFont.systemFont(ofSize: 15)])
        let boldFontAttribute: [NSAttributedString.Key: Any] = [.font: UIFont.boldSystemFont(ofSize: 15),
                                                                .foregroundColor: UIColor.label]
        let range = (self as NSString).range(of: boldString)
        attributedString.addAttributes(boldFontAttribute, range: range)
        return attributedString
    }
}
