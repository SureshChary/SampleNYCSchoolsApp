//
//  School.swift
//  SampleNYCSchoolsApp
//
//  Created by Suresh Durishetti on 27/12/24.
//

import Foundation

struct School: Codable, Identifiable, Hashable {
    let id = UUID()
    var dbn: String
    var schoolName: String
    var latitude: String?
    var longitude: String?
    var totalStudents: String?
    var location: String?
    var website: String?
    var city: String
    var interest: String
    
    enum CodingKeys: String, CodingKey {
        case dbn, latitude, longitude, location, website, city
        case schoolName = "school_name"
        case totalStudents = "total_students"
        case interest = "interest1"
    }
}
