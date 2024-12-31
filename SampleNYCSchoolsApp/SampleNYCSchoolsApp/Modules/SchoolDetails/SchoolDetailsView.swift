//
//  SchoolDetailsView.swift
//  SampleNYCSchoolsApp
//
//  Created by Suresh Durishetti on 28/12/24.
//

import SwiftUI

struct SchoolDetailsView: View {
    @ObservedObject var vm: SchoolDetailsViewModel = SchoolDetailsViewModel()
    let school: School

    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            VStack(alignment: .leading) {
                Text("Total SAT Info:")
                    .bold()
                HStack {
                    Text("Total Students:")
                    Text(school.totalStudents ?? "N/A")
                }
                HStack {
                    Text("Total SAT Test Takers:")
                    Text(vm.score?.totalTestTakers ?? "N/A")
                }
            }
            
            VStack(alignment: .leading) {
                Text("Total SAT Info:")
                    .bold()
                Text(school.location ?? "N/A")
            }
            
            if let score = vm.score {
                VStack(alignment: .leading) {
                    Text("SAT Scores:")
                        .bold()
                    HStack {
                        Text("Math:")
                        Text(score.math ?? "N/A")
                    }
                    HStack {
                        Text("Reading:")
                        Text(score.reading ?? "N/A")
                    }
                    HStack() {
                        Text("Writing:")
                        Text(score.writing ?? "N/A")
                    }
                    Spacer()
                }
            } else {
                if let errorMsg = vm.errorMsg {
                    ErrorView(errorMsg: errorMsg)
                } else if vm.isLoading {
                    LoaderView()
                }
            }
        }
        .padding()
        .onLoad {
            Task {
                await vm.fetchScoreData(school: school)
            }
        }
        .navigationTitle("\(school.schoolName)")
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    SchoolDetailsView(school: .init(dbn: "", schoolName: "School Name", city: "", interest: ""))
}
