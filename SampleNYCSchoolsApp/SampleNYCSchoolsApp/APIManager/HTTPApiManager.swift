//
//  Untitled.swift
//  SampleNYCSchoolsApp
//
//  Created by Suresh Durishetti on 27/12/24.
//

import Foundation

class HTTPApiManager: APIManager {
   
    func getSchoolsData(api: APIEndpoints) async throws -> [School] {
        try await HttpClient.shared.fetchData(url: api.getURL())
    }
    
    func getSchoolDetailsData(api: APIEndpoints) async throws -> [Score] {
        try await HttpClient.shared.fetchData(url: api.getURL())
    }
}
