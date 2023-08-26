//
//  VehicleListVOewController.swift
//  RODO
//
//  Created by NIshit Patel on 8/24/23.
//

import Foundation
import UIKit

class VehicleListViewController: UIViewController {
    
    static func instantiate() -> VehicleListViewController {
        
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: Self.className) as! VehicleListViewController
        return vc
    }
    
    
    // MARK: - Variables
    //
    
    private var vehicleListViewModel: VehicleListViewModel!

    //
    // MARK: - Outlets
    //
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    //
    // MARK: - View Lifecycle
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Vehicle Type"
        
        self.vehicleListViewModel = VehicleListViewModel()
        self.vehicleListViewModel.bindVehicleListViewModelToController = {
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.reloadData()
            }
        }
    }
}

extension VehicleListViewController: UICollectionViewDelegate
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.vehicleListViewModel.arrayVehicles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VehicleListCVCell.className, for: indexPath) as! VehicleListCVCell
        
        let vehicle = self.vehicleListViewModel.arrayVehicles[indexPath.row]
        cell.vehicle = vehicle
        return cell
        
    }
}

extension VehicleListViewController: UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
    }
}

extension VehicleListViewController: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width = (self.collectionView.frame.width - 30) / 2
        return CGSize(width: width,
                      height: width / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets.init(top: 10, left: 10, bottom: 100, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 10
    }
}

