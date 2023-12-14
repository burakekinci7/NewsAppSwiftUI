//
//  NewsAppSwiftUIUITests.swift
//  NewsAppSwiftUIUITests
//
//  Created by Ramazan Burak Ekinci on 8.12.2023.
//

import XCTest

final class NewsAppSwiftUIUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Categories, business"].tap()
        app.collectionViews/*@START_MENU_TOKEN@*/.buttons["technology"]/*[[".cells.buttons[\"technology\"]",".buttons[\"technology\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Conutries, au"].tap()
        app.collectionViews.buttons["us"].tap()
        app.collectionViews/*@START_MENU_TOKEN@*/.staticTexts["iOS 17.2: Apple Suddenly Releases Urgent Update Warning For All iPhone Users - Forbes"]/*[[".cells",".buttons[\"iOS 17.2: Apple Suddenly Releases Urgent Update Warning For All iPhone Users - Forbes, The latest iPhone update has been much-anticipated. Here’s what’s in it, how to get it and why you should want to have it on your phone pronto., - David Phelan\"].staticTexts[\"iOS 17.2: Apple Suddenly Releases Urgent Update Warning For All iPhone Users - Forbes\"]",".staticTexts[\"iOS 17.2: Apple Suddenly Releases Urgent Update Warning For All iPhone Users - Forbes\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Forbes"].buttons["Back"].tap()
        
        
        
        
        // "Go to Second View" butonuna tıkla
        app.buttons["BookMarks"].tap()
        
        


                
                
                
        

                

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
