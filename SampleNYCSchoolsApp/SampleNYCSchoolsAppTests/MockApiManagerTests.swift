//
//  MockApiManagerTests.swift
//  SampleNYCSchoolsApp
//
//  Created by Suresh Durishetti on 28/12/24.
//

import XCTest
@testable import SampleNYCSchoolsApp

final class MockApiManagerTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMockGetSchoolsData() async {
        let mock = MockApiManager()
        do {
            let schools:[School] = try await mock.getSchoolsData(api: APIEndpoints.schools)
            XCTAssertTrue(schools.count > 0, "Mock schools list is not empty")
        } catch {
            XCTFail("Mock schools list is empty")
        }
    }
    
    func testMockGetSchoolDetailsData() async {
        let mock = MockApiManager()
        do {
            let scores:[Score] = try await mock.getSchoolDetailsData(api: APIEndpoints.scores(dbn: ""))
            XCTAssertTrue(scores.count > 0, "Mock scores list is not empty")
        } catch {
            XCTFail("Mock scores list is empty")
        }
    }
    
    func testMockStubResourceError() async {
        let mock = MockApiManager()
        do {
            let _:[School] = try await mock.loadJSONLoader(fileName: "sd")
        } catch {
            XCTAssertEqual((error as? NYCAppError)?.description, NYCAppError.stubResourceFileNotFound.description, "Stub resource file not found test case passed")
        }
    }
    
    func testMockApiParsingError() async {
        let mock = MockApiManager()
        do {
            let _:String = try await mock.loadJSONLoader(fileName: "getListOfSchools_response")
        } catch {
            XCTAssertEqual((error as? NYCAppError)?.description, NYCAppError.apiResponseParsingError.description, "API parsing error test case passed")
        }
    }
}
