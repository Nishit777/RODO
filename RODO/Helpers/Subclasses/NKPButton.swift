//
//  NKPButton.swift

//
//  Created by NIshit Patel on 8/23/23.
//

import UIKit

public class NKPButton: UIButton {
    
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
        
        self.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        self.makeCircleView()
        self.addBorder(.appLightGreen)
        self.tintColor = .appLightGreen
    }
}

