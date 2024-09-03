//
//  CarViewModelTests.swift
//  TrafficTests
//
//  Created by Vladimir Spasov on 3/9/24.
//

import XCTest
@testable import Traffic

class CarViewModelTests: XCTestCase {
    var viewModel: CarViewModel!

    override func setUpWithError() throws {
        viewModel = CarViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testCarModelValidationForInvalidName() throws {
        viewModel.carModel = "Fo"
        XCTAssertFalse(viewModel.isValid, "isValid should be false for car model names shorter than 3 characters")
    }

    func testCarModelValidationForValidName() throws {
        viewModel.carModel = "Ford"
        XCTAssertTrue(viewModel.isValid, "isValid should be true for car model names with 3 or more characters")
    }
}

