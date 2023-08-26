//
//  VehicleData.swift
//  
//
//  Copyright © 2023 NKP. All rights reserved.
//

import Foundation

public struct VehicleData: Decodable, Hashable {
    
    //
    // MARK: - Variables
    //

    let make: String
    let model: String
    let year: Int
    let vehicleCount: Int
    let price: Double
    
    //
    // MARK: - Coding Keys
    //
    
    enum CodingKeys: String, CodingKey {
        case vehicleCount = "vehicle_count"
        case make
        case model
        case year
        case price
    }
    
    //
    // MARK: - Initalizer
    //
    
    public init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.make = try values.decode(String.self, forKey: .make)
        self.model = try values.decode(String.self, forKey: .model)
        self.year = try values.decode(Int.self, forKey: .year)
        self.vehicleCount = try values.decode(Int.self, forKey: .vehicleCount)
        self.price = try values.decode(Double.self, forKey: .price)
    }
}
