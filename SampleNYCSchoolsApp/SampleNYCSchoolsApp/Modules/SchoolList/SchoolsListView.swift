//
//  SchoolsListVC.swift
//  SampleNYCSchoolsApp
//
//  Created by Suresh Durishetti on 27/12/24.
//

import SwiftUI

struct SchoolsListView: View {
    @ObservedObject var vm: SchoolsListViewModel = SchoolsListViewModel()
    
    var body: some View {
        NavigationStack {
            
            VStack {
                if vm.schools.isEmpty {
                    
                    if let errorMsg = vm.errorMsg {
                        ErrorView(errorMsg: errorMsg)
                        Button(action: {
                            Task {
                                await vm.fetchschoolsData()
                            }
                        }) {
                            Text("Retry")
                        }
                        
                    } else if vm.isLoading {
                        LoaderView()
                    }
                } else {
                    List(vm.schools, id: \.id) { school in
                        NavigationLink(value: school) {
                            Text(school.schoolName)
                        }
                    }.refreshable {
                        await vm.fetchschoolsData()
                    }
                }
                
            }
            .navigationTitle("NYC Schools")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: School.self) { school in
                SchoolDetailsView(school: school)
            }
            .onLoad {
                Task {
                    await vm.fetchschoolsData()
                }
            }
        }
    }
}

#Preview {
    SchoolsListView()
}
