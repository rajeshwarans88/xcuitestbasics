//
//  LearningUITests.swift
//  LearningUITests
//
//  Created by Rajeshwaran Sarangarajan on 28/10/22.
//

import XCTest

class LearningUITests: XCTestCase {
    
    var app:XCUIApplication!
    var textField:XCUIElement!
    var submitButton:XCUIElement!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        textField = app.textFields["txtField"]
        submitButton = app.buttons["btnSubmit"]
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app.terminate()
    }
    
    func test_PopUpButtonFunction(){
        
        app.launch()
        let passAlert = app.alerts["Welcome to Demo"]
        let failAlert = app.alerts["Welcome to Dem"]
        
        submitButton.tap()
        let elementsQuery = passAlert.scrollViews.otherElements
        elementsQuery.buttons["OK"].tap()
        
        submitButton.tap()
        XCTAssertTrue(passAlert.exists)

        submitButton.tap()
        XCTAssertFalse(failAlert.exists)
    }
    
    func test_RandomAsserts() {
        XCTAssertTrue(true)
        XCTAssertFalse(false)
        XCTAssertNotNil(app)
        XCTAssertEqual(1+1, 2+0)
    }
    
    func test_SwitchingApps() {
        let fileApp = XCUIApplication(bundleIdentifier: "com.apple.DocumentsApp")
        let shortCutsApp = XCUIApplication(bundleIdentifier: "com.apple.shortcuts")
        app.launch()
        fileApp.launch()
        shortCutsApp.launch()
        app.activate()
        fileApp.activate()
        fileApp.tap()
        fileApp.terminate()
        shortCutsApp.activate()
        shortCutsApp.tap()
        shortCutsApp.terminate()
        app.activate()
    }
    
    func test_VerifyTextBoxContent(){
        let testString = "Automation"
        app.launch()
        textField.tap()
        textField.typeText(testString)
        if let valueEntered = (textField.value) {
            XCTAssertTrue(valueEntered as! String == testString)
        }
    }
    
    func test_FindAllButtonsUsingChildrenAndDescendants(){
        app.launch()
        let allButtons = app.buttons
        print(allButtons)
        let harryButton = app.scrollViews.children(matching: .button).matching(identifier: "Harry")
        print(harryButton)
        let ronButton = app.scrollViews.descendants(matching: .button).matching(identifier: "btnRon")
        print(ronButton)
    }

    func test_CheckHarryButton(){
        app.launch()
        app/*@START_MENU_TOKEN@*/.buttons["btnHarry"]/*[[".scrollViews",".buttons[\"Harry\"]",".buttons[\"btnHarry\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        let elementsQuery = app.sheets.scrollViews.otherElements
        XCTAssertTrue(elementsQuery.staticTexts["Harry Potter"].exists)
        XCTAssertTrue(elementsQuery.staticTexts["Magic Power is  Legendary"].exists)
        elementsQuery.buttons["OK"].tap()
    }

    func test_CheckRonButton(){
        app.launch()
        app.buttons["btnRon"].tap()
        let elementsQuery = app.sheets.scrollViews.otherElements
        XCTAssertTrue(elementsQuery.staticTexts["Ron Weasley"].exists)
        XCTAssertTrue(elementsQuery.staticTexts["Magic Power is  Poor"].exists)
        elementsQuery.buttons["OK"].tap()
    }
    
    func test_CheckHermioneButton(){
        app.launch()
        app.buttons["btnHermione"].tap()
        let elementsQuery = app.sheets.scrollViews.otherElements
        XCTAssertTrue(elementsQuery.staticTexts["Magic Power is  High"].exists)
        XCTAssertTrue(elementsQuery.staticTexts["Harry Potter"].exists) //Should fail
        elementsQuery.buttons["OK"].tap()
    }

}
