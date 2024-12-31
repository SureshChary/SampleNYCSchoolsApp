//
//  SchoolsListViewModel.swift
//  SampleNYCSchoolsApp
//
//  Created by Suresh Durishetti on 27/12/24.
//

import Foundation

class SchoolsListViewModel: ObservableObject {
    
    @Published var schools: [School] = []
    @Published var errorMsg: String? = nil
    @Published var isLoading: Bool = false
    
    private var apimanager: APIManager?
    init(apimanager: APIManager = HTTPApiManager()) {
        if AppConfig.loadStubData {
            self.apimanager = MockApiManager()
        } else {
            self.apimanager = apimanager
        }
    }
    
    @MainActor
    func fetchschoolsData(api:APIEndpoints = APIEndpoints.schools) async {
        self.errorMsg = nil
        self.isLoading = true
        self.schools = []
        do {
            let schools = try await self.apimanager?.getSchoolsData(api: api)
            if let list = schools, !list.isEmpty {
                self.schools = list
            } else {
                self.errorMsg = "No schools found"
            }
            self.isLoading = false
        } catch {
            self.errorMsg = (error as? NYCAppError)?.description ?? error.localizedDescription
            self.schools = []
            self.isLoading = false
        }
    }
}
