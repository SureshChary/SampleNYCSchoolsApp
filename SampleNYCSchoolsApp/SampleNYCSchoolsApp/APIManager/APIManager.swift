//
//  APIManager.swift
//  SampleNYCSchoolsApp
//
//  Created by Suresh Durishetti on 27/12/24.
//

import Foundation

protocol APIManager {
    
    func getSchoolsData(api: APIEndpoints) async throws -> [School]
    func getSchoolDetailsData(api: APIEndpoints) async throws -> [Score]
}
