//
//  VehicleSearchViewModel.swift
//  RODO
//
//  Created by NIshit Patel on 8/26/23.
//

import Foundation

public class VehicleSearchViewModel: NSObject {
    
    
    //
    // MARK: - Variables
    //
    
    private(set) var arrayVehicles : [VehicleData] = []
    
    //
    // MARK: - Methods
    //
    
    public override init() {
        super.init()
        let array = ReadJsonFile().readLocalFile(with: "Exercise_Dataset", resultType: [VehicleData].self) ?? []
        self.arrayVehicles = array
    }
    
    // AND
    public func searchVehiclesAnd(name: String? = nil,
                                  model: String? = nil,
                                  budget: Double? = nil,
                                  year: Int? = nil) -> SearchResultsOutputData
    {
        guard name != nil ||
            model != nil ||
            budget != nil ||
            year != nil else
        {
            return self.setSearchResults([])
        }
        var array: [VehicleData] = self.arrayVehicles
        if let name
        {
            array = array.filter({
                $0.make.contains(name)
            })
        }
        if let model
        {
            array = array.filter({
                $0.model.contains(model)
            })
        }
        
        if let budget
        {
            array = array.filter({
                $0.price < budget
            })
        }
        
        if let year
        {
            array = array.filter({
                $0.year == year
            })
        }
         
        return self.setSearchResults(array)
    }
    
    //OR
    public func searchVehiclesOr(name: String? = nil,
                        model: String? = nil,
                        budget: Double? = nil,
                        year: Int? = nil) -> SearchResultsOutputData
    {
        guard name == nil ||
            model == nil ||
            budget == nil ||
            year == nil else
        {
            return self.setSearchResults([])
        }
        
        var array: [VehicleData] = []
        if let name
        {
            let tmpArray = self.arrayVehicles.filter({
                $0.make.contains(name)
            })
            array.append(contentsOf: tmpArray)
        }
        if let model
        {
            let tmpArray = self.arrayVehicles.filter({
                $0.model.contains(model)
            })
            array.append(contentsOf: tmpArray)
        }
        
        if let budget
        {
            let tmpArray = self.arrayVehicles.filter({
                $0.price < budget
            })
            array.append(contentsOf: tmpArray)
        }
        
        if let year
        {
            let tmpArray = self.arrayVehicles.filter({
                $0.year == year
            })
            array.append(contentsOf: tmpArray)
        }
        
        return self.setSearchResults(array)
    }
    
    public func setSearchResults(_ results: [VehicleData]) -> SearchResultsOutputData
    {
        let setOfVehicles = Set(results)
        let sortedArray = setOfVehicles.sorted(by: {
            $0.price < $1.price
        })
        if let first = sortedArray.first,
           let last = sortedArray.last,
           sortedArray.isEmpty == false
        {
            let searchResults = SearchResultsOutputData(vehicleCount: sortedArray.count,
                                                        highestPrice: last.price,
                                                        lowestPrice: first.price,
                                                        medianPrice: sortedArray.medianPrice)
            return searchResults
        }
        else
        {
            let searchResults = SearchResultsOutputData(vehicleCount: 0,
                                                        highestPrice: 0,
                                                        lowestPrice: 0,
                                                        medianPrice: 0)
            return searchResults
        }
    }
}

private extension Array where Element == VehicleData
{
    var medianPrice: Double {
        
        let first = self[(self.count - 1) / 2].price
        if self.count % 2 == 0 {
            let second = self[(self.count) / 2].price
            return (first + second) / 2
        } else {
            return first
        }
    }
}
