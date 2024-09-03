//
//  TrafficLightViewModelTests.swift
//  TrafficTests
//
//  Created by Vladimir Spasov on 3/9/24.
//

import XCTest
@testable import Traffic

class TrafficLightViewModelTests: XCTestCase {
    var viewModel: TrafficLightViewModel!
    var mockTimer: MockTimer!

    override func setUpWithError() throws {
        mockTimer = MockTimer()
        Task { @MainActor in
            viewModel = TrafficLightViewModel(timer: mockTimer)
        }
    }

    override func tearDownWithError() throws {
        Task { @MainActor in
            viewModel = nil
            mockTimer = nil
        }
    }

    func testInitialTrafficLightState() throws {
        Task { @MainActor in
            XCTAssertEqual(viewModel.currentLight, .red, "Initial traffic light state should be Red")
        }
    }

    func testTrafficLightCycle() throws {
        Task { @MainActor in
            XCTAssertEqual(viewModel.currentLight, .red, "Traffic light should start with Red")

            mockTimer.trigger()
            XCTAssertEqual(viewModel.currentLight, .green, "Traffic light should turn Green after Red")

            mockTimer.trigger()
            XCTAssertEqual(viewModel.currentLight, .orange, "Traffic light should turn Orange after Green")

            mockTimer.trigger()
            XCTAssertEqual(viewModel.currentLight, .red, "Traffic light should return to Red after Orange")
        }
    }
}

