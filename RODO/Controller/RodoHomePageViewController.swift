//
//  RodoHomePageViewController.swift
//
//
//  Copyright © 2023 NKP. All rights reserved.
//

import Foundation
import UIKit

class RodoHomePageViewController: UIViewController {
    
    static func instantiate() -> RodoHomePageViewController {
        
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: Self.className) as! RodoHomePageViewController
        return vc
    }
    
    
    // MARK: - Variables
    //
    
    
    //
    // MARK: - Outlets
    //
    
    @IBOutlet private weak var searchbar: NKPSearchBar!
    @IBOutlet private weak var buttonSearchVehicle: NKPButton!
    @IBOutlet private weak var buttonDealsOfTheDay: NKPButton!
    
    //
    // MARK: - View Lifecycle
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        

    }
    @IBAction func didTapButtonSearchVehicle(_ sender: NKPButton)
    {
        let vc = VehicleListViewController.instantiate()
        self.navigationController?.pushViewController(vc,
                                                      animated: true)
    }
    
    @IBAction func didTapButtonDealsOfTheDay(_ sender: NKPButton)
    {
        let vehicleSearchViewModel: VehicleSearchViewModel = VehicleSearchViewModel()
        
        print(vehicleSearchViewModel.searchVehiclesAnd(model: "TLX"))
        print(vehicleSearchViewModel.searchVehiclesAnd(budget: 50000))
        print(vehicleSearchViewModel.searchVehiclesAnd(year: 2017))
    }
}
