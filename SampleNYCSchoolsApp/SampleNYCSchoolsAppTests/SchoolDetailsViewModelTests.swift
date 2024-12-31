//
//  SchoolDetailsViewModelTests.swift
//  SampleNYCSchoolsApp
//
//  Created by Suresh Durishetti on 28/12/24.
//

import XCTest
@testable import SampleNYCSchoolsApp

final class SchoolDetailsViewModelTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSchoolDetailsViewModelVariable() {
        let detailsVM = SchoolDetailsViewModel()
        XCTAssertNil(detailsVM.score, "score is empty on initialization")
        XCTAssertNil(detailsVM.errorMsg, "errorMsg is empty on initialization")
        XCTAssertTrue(detailsVM.isLoading == false, "isLoading is false on initialization")

    }
    
    func testFetchScoreData() async {
        let expectedSchool = School(dbn: "21K728", schoolName: "LIBERATION DIPLOMA PLUS", city: "", interest: "")
        let detailsVM = SchoolDetailsViewModel()
        await detailsVM.fetchScoreData(school: expectedSchool)
        XCTAssertEqual(detailsVM.score?.dbn, expectedSchool.dbn, "Given school has valid score values")
    }
    
    func testErrorFetchScoreData() async {
        let expectedSchool = School(dbn: "", schoolName: "LIBERATION DIPLOMA PLUS", city: "", interest: "")
        let detailsVM = SchoolDetailsViewModel()
        await detailsVM.fetchScoreData(school: expectedSchool)
        XCTAssertNil(detailsVM.score, "score is nil for empty dbn")
        XCTAssertEqual(detailsVM.errorMsg, "No score found for \(expectedSchool.schoolName)", "Given school has no dbn")
    }
}
