//
//  HogwartsUnitTests.swift
//  UnitTests
//
//  Created by Rajeshwaran Sarangarajan on 29/10/22.
//

import XCTest
@testable import Learning

class HogwartsUnitTests: XCTestCase {
    var testWizard:Hogwarts!
    

    override func setUpWithError() throws {
        testWizard = Hogwarts(name: "TestWizard", wandType: .Broken)
    }

    override func tearDownWithError() throws {
        testWizard = nil
    }
    
    func test_VerifyBrokenWand(){
        testWizard.wandType = .Broken
        testWizard.getXP()
        XCTAssertTrue(testWizard.magicXP == "Poor")
    }

    func test_VerifyDragonWand(){
        testWizard.wandType = .DragonString
        testWizard.getXP()
        XCTAssertTrue(testWizard.magicXP == "High")
    }

    func test_VerifyElderWand(){
        testWizard.wandType = .ElderWand
        testWizard.getXP()
        XCTAssertTrue(testWizard.magicXP == "Legendary")
    }

}
