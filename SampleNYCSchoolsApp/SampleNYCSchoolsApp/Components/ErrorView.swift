//
//  ErrorView.swift
//  SampleNYCSchoolsApp
//
//  Created by Suresh Durishetti on 27/12/24.
//

import SwiftUI

public struct ErrorView: View {
    
    let errorMsg: String
    public init(errorMsg: String) {
        self.errorMsg = errorMsg
    }
    
    public var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text(errorMsg)
                .font(.headline.bold())
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
            Spacer()
        }
    }
}
