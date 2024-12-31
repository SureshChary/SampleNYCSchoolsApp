//
//  SchoolsListViewModelTests.swift
//  SampleNYCSchoolsApp
//
//  Created by Suresh Durishetti on 28/12/24.
//

import XCTest
@testable import SampleNYCSchoolsApp

final class SchoolsListViewModelTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSchoolsListViewModelVariable() {
        let listVM = SchoolsListViewModel()
        XCTAssertTrue(listVM.schools.count == 0, "schools list is empty on initialization")
        XCTAssertNil(listVM.errorMsg, "errorMsg is empty on initialization")
        XCTAssertTrue(listVM.isLoading == false, "isLoading is false on initialization")

    }
    
    func testFetchschoolsData() async {
        let listVM = SchoolsListViewModel()
        await listVM.fetchschoolsData()
        XCTAssertTrue(listVM.schools.count > 0, "schools list is not empty")
    }
    
    func testStubFetchschoolsData() async {
        let listVM = SchoolsListViewModel(apimanager: MockApiManager())
        await listVM.fetchschoolsData()
        XCTAssertTrue(listVM.schools.count > 0, "stub schools list is not empty")
    }
    
    func testApiCallFailedErrorFetchschoolsData() async {
        let listVM = SchoolsListViewModel()
        await listVM.fetchschoolsData(api: APIEndpoints.none)
        XCTAssertEqual(listVM.errorMsg, NYCAppError.apiCallFailedError.description, "API call failed test case passed")
    }
}

