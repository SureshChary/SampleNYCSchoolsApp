//
//  MockApiManager.swift
//  SampleNYCSchoolsApp
//
//  Created by Suresh Durishetti on 28/12/24.
//

import Foundation

/**
 MockApiManager will read data from stub files. This concept helps in creating and validating the UI fastly.
 */
class MockApiManager: APIManager {
    func getSchoolsData(api: APIEndpoints) async throws -> [School] {
        try await loadJSONLoader(fileName: api.getStubFileName())
    }
    
    func getSchoolDetailsData(api: APIEndpoints) async throws -> [Score] {
        try await loadJSONLoader(fileName: api.getStubFileName())
    }
    
    func loadJSONLoader<T: Decodable>(fileName: String) async throws -> T {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else { throw NYCAppError.stubResourceFileNotFound
        }
 
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NYCAppError.apiResponseParsingError
        }
    }
}
