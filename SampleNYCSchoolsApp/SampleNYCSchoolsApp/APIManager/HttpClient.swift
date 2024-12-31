//
//  HttpClient.swift
//  SampleNYCSchoolsApp
//
//  Created by Suresh Durishetti on 27/12/24.
//

import Foundation

final class HttpClient {
    public static let shared: HttpClient = HttpClient()
}
/// Connect the back-end using URLSessionDataTask
extension HttpClient {
    
    func fetchData<T: Decodable>(url: URL) async throws -> T {

        var urlRequest = URLRequest(url: url)
        // Use cached data if available
        urlRequest.cachePolicy = .returnCacheDataElseLoad

        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw NYCAppError.notValidAPIstatusCodeError
        }
                
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NYCAppError.apiResponseParsingError
        }
    }
}
