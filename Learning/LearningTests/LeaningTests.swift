//
//  LearningTests.swift
//  LearningTests
//
//  Created by Rajeshwaran Sarangarajan on 28/10/22.
//

import XCTest
@testable import Learning

class CarUnitTests: XCTestCase {
    
    var jeep:Car!
    var honda:Car!
    let minutes = 60

    override func setUpWithError() throws {
        try? super.setUpWithError()
        jeep = Car(type: .OffRoad, transmissionMode: .Drive)
        honda = Car(type: .Economy, transmissionMode: .Park)
    }

    override func tearDownWithError() throws {
        try? super.tearDownWithError()
        jeep = nil
        honda = nil
    }

    func testMilesCalc() {
        honda.transmissionMode = .Drive
        jeep.transmissionMode = .Drive
        jeep.start(minutes: minutes)
        XCTAssertTrue(honda.miles < jeep.miles)
    }
    
    func testMilesInOtherModes() {
        jeep.transmissionMode = .Park
        honda.transmissionMode = .Reverse
        jeep.start(minutes: minutes)
        honda.start(minutes: minutes)
        XCTAssertTrue(jeep.miles == 0)
        XCTAssertTrue(honda.miles == 0)
    }
}
