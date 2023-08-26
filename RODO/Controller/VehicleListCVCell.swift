//
//  CountryTVCell.swift
//  Countries
//
//  Created by NIshit Patel on 8/24/23.
//

import UIKit

class VehicleListCVCell: UICollectionViewCell {
    
    //
    // MARK: - Variables
    //
    
    var vehicle: VehicleData? {
        didSet {
            self.setVehicleDetails()
        }
    }
    
    //
    // MARK: - Outlets
    //
    @IBOutlet private weak var labelName: UILabel!
    @IBOutlet private weak var labelImage: UIImageView!

    //
    // MARK: - Methods
    //
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        
    }
    
    private func setVehicleDetails()
    {
        guard let vehicle = vehicle else { return }
        
        self.labelName.text = vehicle.model + " - " + "\(vehicle.year)"
    }
}

