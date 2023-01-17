//
//  weInternetUITests.swift
//  weInternetUITests
//
//  Created by Mohamed Shaikhon on 10/15/19.
//  Copyright © 2019 ahmedfouad. All rights reserved.
//

import XCTest

class weInternetUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("--uitesting")
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
//        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    var app: XCUIApplication!

    func testSearchFilter() {
        app.launch()
        XCTAssertTrue(app.buttons["التالي"].exists, "next button doesn't exist" )
        app.buttons["التالي"].tap()
        app.buttons["البدء"].tap()
        app.buttons["تخطي"].tap()
        app.otherElements["container2"].tap()
        app.buttons["ابحث"].tap()
        app.buttons["back"].tap()
        app.buttons["ابحث"].tap()
        app.buttons["اذهب"].tap()

//        app.otherElements.children(matching: .any)["cityBtn"].tap()
//        app.tables.element(boundBy: 3).tap()
//        app.otherElements["cityBtn"].tap()

    }

}
