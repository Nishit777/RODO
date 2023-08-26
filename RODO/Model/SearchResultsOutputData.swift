//
//  SearchResultsOutputData.swift
//  RODO
//
//  Created by NIshit Patel on 8/25/23.
//

import Foundation

public struct SearchResultsOutputData: Decodable, Hashable {
    
    //
    // MARK: - Variables
    //
    
    public let vehicleCount: Int
    public let highestPrice: Double
    public let lowestPrice: Double
    public let medianPrice: Double
    
}
