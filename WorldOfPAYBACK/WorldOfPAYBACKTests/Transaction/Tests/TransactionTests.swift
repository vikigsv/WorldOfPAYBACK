//
//  TransactionTests.swift
//  WorldOfPAYBACKTests
//
//  Created by Vignesh on 04/02/2023.
//

import XCTest
@testable import WorldOfPAYBACK

final class TransactionTests: XCTestCase {
    
    let viewModel: TransactionViewModel = .init(repo: TestTransactionRepoSpy())
    
    override func setUpWithError() throws {
        viewModel.onAppear()
    }
    
    override func tearDownWithError() throws {
        
    }
    
    /**
     Below test case checks the items count to avoid missing of data in an event of filtration bug
     The Mock data contains the following Transaction Items:
     Total: 100, Category A: 13, Category B: 7, Category C: 1
     **/
    func testTransactionItems() throws {
        let exp = expectation(description: "Wait for 2 sec to load the data")
        let result = XCTWaiter.wait(for: [exp], timeout: 2.0)
        if result == XCTWaiter.Result.timedOut {
            viewModel.selectedCategory = .none
            XCTAssertEqual(viewModel.transaction.filteredItems.count, 21)
            viewModel.selectedCategory = .a
            XCTAssertEqual(viewModel.transaction.filteredItems.count, 13)
            viewModel.selectedCategory = .b
            XCTAssertEqual(viewModel.transaction.filteredItems.count, 7)
            viewModel.selectedCategory = .c
            XCTAssertEqual(viewModel.transaction.filteredItems.count, 1)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testSortValues() throws {
        let exp = expectation(description: "Wait for 2 sec to load the data")
        let result = XCTWaiter.wait(for: [exp], timeout: 2.0)
        if result == XCTWaiter.Result.timedOut {
            switch viewModel.selectedSortType {
            case .recent:
                viewModel.transaction.filteredItems.enumerated().forEach({ index, item in
                    if viewModel.transaction.filteredItems.count == (index + 1) {
                        XCTAssert(true)
                        return
                    }
                    let nextItem = viewModel.transaction.filteredItems[index + 1]
                    guard let currentDate = item.transactionDetail.bookingDate.toDate(format: .networkDate)?.timeIntervalSince1970,
                          let nextDate = nextItem.transactionDetail.bookingDate.toDate(format: .networkDate)?.timeIntervalSince1970 else {
                        XCTFail("Invalid Date")
                        return
                    }
                    XCTAssertGreaterThanOrEqual(currentDate, nextDate, "\(item.partnerDisplayName) next: \(nextItem.partnerDisplayName)")
                })
            }
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testMissingFields() throws {
        let exp = expectation(description: "Wait for 2 sec to load the data")
        let result = XCTWaiter.wait(for: [exp], timeout: 2.0)
        if result == XCTWaiter.Result.timedOut {
            viewModel.transaction.filteredItems.forEach({ item in
                XCTAssertFalse(item.partnerDisplayName.count == 0)
                XCTAssertFalse(item.transactionDetail.value.amount == nil)
                XCTAssertFalse(item.transactionDetail.value.currency == .none)
            })
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testFilterPerformanceExample() throws {
        self.measure {
            viewModel.onSortChanged()
        }
    }
    
    func testSortPerformanceExample() throws {
        self.measure {
            viewModel.onSortChanged()
        }
    }
    
}
