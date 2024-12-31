//
//  SchoolDetailsViewModel.swift
//  SampleNYCSchoolsApp
//
//  Created by Suresh Durishetti on 28/12/24.
//

import SwiftUI

class SchoolDetailsViewModel: ObservableObject {
    
    @Published var score: Score? = nil
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
    func fetchScoreData(school: School) async {
        self.errorMsg = nil
        self.isLoading = true
        self.score = nil
        do {
            let api = APIEndpoints.scores(dbn: school.dbn)
            let scores = try await self.apimanager?.getSchoolDetailsData(api: api)
            if let score = scores?.first(where: { $0.dbn == school.dbn }) {
                self.score = score
            } else {
                self.errorMsg = "No score found for \(school.schoolName)"
            }
            self.isLoading = false
        } catch {
            self.errorMsg = (error as? NYCAppError)?.description ?? error.localizedDescription
            self.score = nil
            self.isLoading = false
        }
    }
}
