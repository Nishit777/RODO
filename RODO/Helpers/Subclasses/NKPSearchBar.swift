//
//  NKPSearchBar.swift

//
//  Created by NIshit Patel on 8/23/23.
//

import UIKit
public class NKPSearchBar: UISearchBar {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    private func commonInit(){
        self.backgroundImage = UIImage()
        self.backgroundColor = .white
        self.setImage(UIImage(), for: .search, state: .normal)
        
        self.searchTextField.backgroundColor = UIColor.white
        self.searchTextField.attributedPlaceholder = NSAttributedString(string: self.searchTextField.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        self.searchTextField.font = .systemFont(ofSize: 14, weight: .bold)
    }
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.makeCircleView()
    }
}
