//
//  APIEndpoints.swift
//  SampleNYCSchoolsApp
//
//  Created by Suresh Durishetti on 28/12/24.
//

import Foundation
/// Define all api end points here.
enum APIEndpoints {
    
    case schools
    case scores(dbn: String)
    case none
    
    func getURL() throws -> URL {
        
        var urlString = ""
        switch self {
        case .schools:
            urlString = "\(AppConfig.rootString)/resource/s3k6-pzi2.json"
        case .scores(dbn: let dbn):
            urlString = "\(AppConfig.rootString)/resource/f9bf-2cp4.json?dbn=\(dbn)"
        default:
            urlString = ""
        }
        guard let url = URL(string: urlString) else {
            throw NYCAppError.apiCallFailedError
        }
        return url
    }
    
    /// Define all api endpoints stub file names here
    func getStubFileName() -> String {
        var fileName = ""
        switch self {
        case .schools:
            fileName = "getListOfSchools_response"
        case .scores(dbn: _):
            fileName = "getDetailsOfSchool_response"
        default: break
        }
        return fileName
    }
}
