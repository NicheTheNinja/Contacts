//
//  ContactsUITests.swift
//  ContactsUITests
//
//  Created by Neshanthan Thevarajah on 2016-01-08.
//  Copyright © 2016 Ninja Garden. All rights reserved.
//

import XCTest

class ContactsUITests: XCTestCase {
    
    let app = XCUIApplication()
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDeletingRow() {
        while app.tables.cells.count == 0 {
            // busy wait
        }
        
        let cellCount = app.tables.cells.count
        app.tables.cells.elementBoundByIndex(0).swipeLeft()
        
        let tablesQuery = XCUIApplication().tables
        tablesQuery.buttons["Delete"].tap()
        
        XCTAssertEqual(app.tables.cells.count, cellCount - 1, "Contacts have not been deleted.")
    }
    
}
