//
//  VehicleListViewModel.swift
//  
//
//  Copyright © 2023 NKP. All rights reserved.
//

import Foundation

public class VehicleListViewModel: NSObject {
    
    //
    // MARK: - Variables
    //
    
    private(set) var arrayVehicles : [VehicleData] = [] {
        didSet {
            self.bindVehicleListViewModelToController()
        }
    }
    
    var bindVehicleListViewModelToController : (() -> ()) = {}
    
    //
    // MARK: - Methods
    //
    
    public override init() {
        super.init()
        let array = ReadJsonFile().readLocalFile(with: "Exercise_Dataset", resultType: [VehicleData].self) ?? []
        self.arrayVehicles = array
        }
}
