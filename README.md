# SampleNYCSchoolsApp
Sample NYC Schools App for Assignment using SwiftUI. 

1. This sample has 2 screens only. List screen shows school names and detail screen show the school score.
2. Implemented MVVM using SwiftUI's ObservableObject concept
3. Network Layer: Define APIManager protocol to handle all api calls. 
4. Properly handled error handling using throw and throws concept.
5. For asynchronous task, used async-await concept to get api data.
6. Unit Testing: Using XCTest framework validated all business logic, mainly ViewModels. Achieved 60% above code coverage.


Things can do:
1. Dependency injection
2. AppTheme: Using color set can support dark and light mode.
3. Coordinator Pattern: Using @EnvironmentObject and NavigationStack can handle app naviagtion.

Dev tools: Xcode 16.2 with iOS 18
