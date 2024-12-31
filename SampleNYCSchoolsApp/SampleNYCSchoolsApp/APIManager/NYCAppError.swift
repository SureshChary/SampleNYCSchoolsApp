//
//  NYCAppError.swift
//  SampleNYCSchoolsApp
//
//  Created by Suresh Durishetti on 27/12/24.
//

import Foundation

/// Define all aplication errors here
enum NYCAppError: Error {
    case apiCallFailedError
    case notValidAPIstatusCodeError
    case apiResponseParsingError
    case stubResourceFileNotFound
    case somethingWrong
    
    var title :String {
        switch self {
        case .somethingWrong:
            return "Something went wrong"
        default:
            return "API Error"
        }
    }
    
    var description :String {
        
        switch self {
        case .apiCallFailedError:
            return "API call failed"
        case .notValidAPIstatusCodeError:
            return "Something wrong with back-end side"
        case .apiResponseParsingError:
            return "API parsing error"
        case .stubResourceFileNotFound:
            return "Stub resource file not found"
        case .somethingWrong:
            return "Something went wrong"
        }
    }
}
