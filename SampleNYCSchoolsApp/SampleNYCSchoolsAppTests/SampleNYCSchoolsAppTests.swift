//
//  SampleNYCSchoolsAppTests.swift
//  SampleNYCSchoolsAppTests
//
//  Created by Suresh Durishetti on 27/12/24.
//

import XCTest
@testable import SampleNYCSchoolsApp

final class SampleNYCSchoolsAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAPIEndpoints() {
        let rootString = "https://data.cityofnewyork.us"
        let schools = "\(rootString)/resource/s3k6-pzi2.json"
        let scores = "\(rootString)/resource/f9bf-2cp4.json?dbn="
        
        do {
            XCTAssertEqual(AppConfig.rootString, rootString, "Base root URL is incorrect")
            XCTAssertEqual(try APIEndpoints.schools.getURL().absoluteString, schools, "schools URL is incorrect")
            XCTAssertEqual(try APIEndpoints.scores(dbn: "").getURL().absoluteString, scores, "scores URL is incorrect")
        } catch {
            XCTFail("APIEndpoints error: \(error)")
        }
    }
    
    func testNYCAppError() {
        let expectedsomeError = "Something went wrong"
        let apiErrorTitle = "API Error"
        let expectedApiCallFailedDesc = "API call failed"

        let someWrongError = NYCAppError.somethingWrong
        XCTAssertEqual(someWrongError.title, expectedsomeError, "SomeWrongError title is incorrect")
        XCTAssertEqual(someWrongError.description, expectedsomeError, "SomeWrongError description is incorrect")

        let apiError = NYCAppError.apiCallFailedError
        XCTAssertEqual(apiError.title, apiErrorTitle, "Api call  title is incorrect")
        XCTAssertEqual(apiError.description, expectedApiCallFailedDesc, "Api call Error description is incorrect")
    }
    
    func testErrorView() {
        let expected = "Error Message"
        let errorView = ErrorView(errorMsg: expected)
        XCTAssertEqual(errorView.errorMsg, expected,  "Error Message is incorrect")
    }
    
    func testLoaderView() {
        let expected = "Loading Message"
        let loader = LoaderView(title: expected)
        XCTAssertEqual(loader.title, expected,  "LoaderView title is incorrect")
    }
}
