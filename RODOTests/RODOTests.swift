//
//  RODOTests.swift
//  RODOTests
//
//  Created by NIshit Patel on 8/25/23.
//

import XCTest
import RODO

final class RODOTests: XCTestCase {
    
    let vehicleSearchViewModel: VehicleSearchViewModel = VehicleSearchViewModel()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    /// Test for invalid search
    func testVehicleSearchEmptyNoResult() throws {
        
        let arrayAnd = vehicleSearchViewModel.searchVehiclesAnd(name: "random")
        let arrayOr = vehicleSearchViewModel.searchVehiclesOr(name: "random")
        
        XCTAssertEqual(arrayAnd, arrayOr)
        XCTAssertEqual(arrayAnd.vehicleCount, 0)
        XCTAssertEqual(arrayAnd.highestPrice, 0.0)
        XCTAssertEqual(arrayAnd.lowestPrice, 0.0)
        XCTAssertEqual(arrayAnd.medianPrice, 0.0)
    }
    func testVehicleSearchEmptySearch() throws {
        
        let arrayAnd = vehicleSearchViewModel.searchVehiclesAnd()
        let arrayOr = vehicleSearchViewModel.searchVehiclesOr()
        
        XCTAssertEqual(arrayAnd, arrayOr)
        XCTAssertEqual(arrayAnd.vehicleCount, 0)
        XCTAssertEqual(arrayAnd.highestPrice, 0.0)
        XCTAssertEqual(arrayAnd.lowestPrice, 0.0)
        XCTAssertEqual(arrayAnd.medianPrice, 0.0)
    }
    
    /// Test for vehicle search via NAME
    func testVehicleSearchResultsBasedOnName() throws {
        
        let arrayAnd = vehicleSearchViewModel.searchVehiclesAnd(name: "Audi")
        let arrayOr = vehicleSearchViewModel.searchVehiclesOr(name: "Audi")
        
        XCTAssertEqual(arrayAnd, arrayOr)
        XCTAssertEqual(arrayAnd.vehicleCount, 108)
        XCTAssertEqual(arrayAnd.highestPrice, 321707.0)
        XCTAssertEqual(arrayAnd.lowestPrice, 4029.0)
        XCTAssertEqual(arrayAnd.medianPrice, 70303.0)
    }
    
    /// Test for vehicle search via MODEL
    func testVehicleSearchResultsBasedOnModel() throws {
        
        let arrayAnd = vehicleSearchViewModel.searchVehiclesAnd(model: "TLX")
        let arrayOr = vehicleSearchViewModel.searchVehiclesOr(model: "TLX")
        
        XCTAssertEqual(arrayAnd, arrayOr)
        XCTAssertEqual(arrayAnd.vehicleCount, 5)
        XCTAssertEqual(arrayAnd.highestPrice, 109623.0)
        XCTAssertEqual(arrayAnd.lowestPrice, 20904.0)
        XCTAssertEqual(arrayAnd.medianPrice, 27271.0)
    }
    
    /// Test for vehicle search via BUDGET
    func testVehicleSearchResultsBasedOnBudget() throws {
    
        let arrayAnd = vehicleSearchViewModel.searchVehiclesAnd(budget: 50000)
        let arrayOr = vehicleSearchViewModel.searchVehiclesAnd(budget: 50000)
        
        XCTAssertEqual(arrayAnd, arrayOr)
        XCTAssertEqual(arrayAnd.vehicleCount, 869)
        XCTAssertEqual(arrayAnd.highestPrice, 49932.0)
        XCTAssertEqual(arrayAnd.lowestPrice, 76.0)
        XCTAssertEqual(arrayAnd.medianPrice, 25617.0)
        XCTAssertLessThan(arrayAnd.highestPrice, 50000.0)
    }
    
    /// Test for vehicle search via MANUFACTURING YEAR
    func testVehicleSearchResultsBasedOnYear() throws {
        
        let arrayAnd = vehicleSearchViewModel.searchVehiclesAnd(year: 2017)
        let arrayOr = vehicleSearchViewModel.searchVehiclesAnd(year: 2017)
        
        XCTAssertEqual(arrayAnd, arrayOr)
        XCTAssertEqual(arrayAnd.vehicleCount, 150)
        XCTAssertEqual(arrayAnd.highestPrice, 98821.0)
        XCTAssertEqual(arrayAnd.lowestPrice, 96.0)
        XCTAssertEqual(arrayAnd.medianPrice, 32501.0)
    }
    
    /// Test for vehicle search based Multiple Inputs using AND
    func testVehicleSearchResultsBasedOnMultipleInputsUsingAnd() throws {
                
        let arrayAnd = vehicleSearchViewModel.searchVehiclesAnd(model: "Outback", budget: 100000, year: 2020)
        
        XCTAssertEqual(arrayAnd.vehicleCount, 1)
        XCTAssertEqual(arrayAnd.highestPrice, 81347.0)
        XCTAssertEqual(arrayAnd.lowestPrice, 81347.0)
        XCTAssertEqual(arrayAnd.medianPrice, 81347.0)
    }
    
    /// Test for vehicle search based Multiple Inputs using OR
    func testVehicleSearchResultsBasedOnMultipleInputsUsingOR() throws {
                
        let arrayAnd = vehicleSearchViewModel.searchVehiclesOr(model: "Outback", budget: 15000, year: 2020)
        
        XCTAssertEqual(arrayAnd.vehicleCount, 570)
        XCTAssertEqual(arrayAnd.highestPrice, 251686.0)
        XCTAssertEqual(arrayAnd.lowestPrice, 76.0)
        XCTAssertEqual(arrayAnd.medianPrice, 19482.0)
    }
}
