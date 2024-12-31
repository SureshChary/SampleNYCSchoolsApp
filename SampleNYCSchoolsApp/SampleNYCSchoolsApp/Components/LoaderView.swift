//
//  LoaderView.swift
//  SampleNYCSchoolsApp
//
//  Created by Suresh Durishetti on 28/12/24.
//

import SwiftUI

public struct LoaderView: View {
    
    let title: String
    public init(title: String = "Loading...") {
        self.title = title
    }
    
    public var body: some View {
        ZStack {
            Color.black.opacity(0.05)
                .ignoresSafeArea()
            VStack {
                Text(title)
                    .font(.headline)
                    .lineLimit(1)
                    .padding([.top], 5)
                ProgressView()
                    .scaleEffect(1, anchor: .center)
                    .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                    .controlSize(.large)
            }
        }
    }
}
