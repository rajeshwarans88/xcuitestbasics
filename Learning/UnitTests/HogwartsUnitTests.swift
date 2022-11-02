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
    var gwtTestWizard:Hogwarts!
    
    override func setUpWithError() throws {
        testWizard = Hogwarts(name: "TestWizard", wandType: .Broken)
    }

    override func tearDownWithError() throws {
        testWizard = nil
    }
    
    func test_VerifyBrokenWand(){
        testWizard.wandType = .Broken
        testWizard.setXP()
        XCTAssertTrue(testWizard.magicXP == "Poor")
    }

    func test_VerifyDragonWand(){
        testWizard.wandType = .DragonString
        testWizard.setXP()
        XCTAssertTrue(testWizard.magicXP == "High")
    }

    func test_VerifyElderWand(){
        testWizard.wandType = .ElderWand
        testWizard.setXP()
        XCTAssertTrue(testWizard.magicXP == "Legendary")
    }
    
    func test_VerifyElderWandGWT() {
        givenIamATestWizard()
        whenIgetMyWand(wandType: .ElderWand)
        thenIseeMyMagicXP(expectedXP: "Legendary")
    }
    
    func givenIamATestWizard(){
        XCTContext.runActivity(named: "Given I am a Wizard") { _ in
            gwtTestWizard = Hogwarts(name: "GWT Wiz", wandType: .New)
        }
    }
    
    func whenIgetMyWand(wandType : WandType){
        XCTContext.runActivity(named: "When I get my wand \(wandType)") { _ in
            gwtTestWizard.wandType = wandType
            
        }
    }
    
    func thenIseeMyMagicXP(expectedXP : String){
        XCTContext.runActivity(named: "Then I see my magic XP as \(expectedXP)") { _ in
        gwtTestWizard.setXP()
        XCTAssertTrue(gwtTestWizard.magicXP == expectedXP)
        }
    }
    
    
}
