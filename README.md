# PAYBACK Coding Challenge

PAYBACK Assesment is a simple lists/Detail screen application which presents PAYBACK transactions from api/mock.

The application is developed with MVVM - (Model View ViewModel) Clean Architecture.

![alt text](https://github.com/vikigsv/WorldOfPAYBACK/blob/main/Documentation/arch.jpg)

## Notes
For demo purpose there is DemoTransactionRepo injected into the ViewModel:
* Do pull to refresh on transaction List multiple times to create random error banner.

## Features
* Sort by Recent booking date.
* Filter by Category.
* Total Transaction amount.
* Error view available when network fails and there is no data and reload button to retry.
* XCTest cases included to validate the mock data representation and performance measurments.
* Localization

### Requirements
* Xcode 14.1
* Swift
* SwiftUI
* Combine

### Supported devices:
* iPhone
* iPad

### Environment
* iOS 15.0+

### External Dependency
* NA
