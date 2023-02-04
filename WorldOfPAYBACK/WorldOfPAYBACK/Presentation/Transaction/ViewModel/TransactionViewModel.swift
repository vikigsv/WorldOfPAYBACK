//
//  TransactionViewModel.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import Foundation
import Combine

class TransactionViewModel: ViewModel {
    
    let repo: TransactionRepository
    @Published var transaction: Transaction = .init(items: [])
    @Published var selectedSortType: TransactionSortUseCase.SortType = .recent {
        didSet {
            onSortChanged()
        }
    }
    @Published var selectedCategory: Transaction.Item.Category = .none {
        didSet {
            onCategoryChanged()
        }
    }
    
    init(repo: TransactionRepository) {
        self.repo = repo
        super.init()
        onAppear()
    }
    
    func onAppear() {
        fetchTransaction()
    }
    
    func onSortChanged() {
        transaction.filteredItems = sort(items: transaction.filteredItems, sortType: selectedSortType)
    }
    
    func onCategoryChanged() {
        filterThenSort()
    }
    
    func onErrorViewAction() {
        updateViewWith(state: .hideErrorView)
        fetchTransaction()
    }
    
    @Sendable func onPullToRefresh() async {
        fetchTransaction()
    }
    
    func filterThenSort() {
        let items = filter(items: transaction.items, category: selectedCategory)
        transaction.filteredItems = sort(items: items, sortType: selectedSortType)
        transaction.transactionTotal = calculateTotal()
    }
}

extension TransactionViewModel {
    
    private func fetchTransaction() {
        updateViewWith(state: .showProgress(true))
        TransactionFetchUseCase(repo: repo).execute()
            .sink { [weak self] status in
                switch status {
                case .finished:
                    self?.updateViewWith(state: .showProgress(false))
                    self?.disposeBag.cancel()
                case .failure(let error):
                    self?.updateViewWith(state: .showBanner(title: LocalizableKey.failed.rawValue, details: error.description, type: .error))
                    if self?.transaction.filteredItems.count == 0 {
                        self?.updateViewWith(state: .showErrorView(title: LocalizableKey.failed.rawValue, details: error.description))
                    }
                    self?.updateViewWith(state: .showProgress(false))
                }
            } receiveValue: { [weak self] transaction in
                self?.transaction = transaction
                self?.filterThenSort()
            }
            .store(in: disposeBag)
    }
    
    private func sort(items: [Transaction.Item], sortType: TransactionSortUseCase.SortType) -> [Transaction.Item] {
        let useCase = TransactionSortUseCase(transactionItems: items, sortType: sortType)
        return useCase.execute()
    }
    
    private func filter(items: [Transaction.Item], category: Transaction.Item.Category) -> [Transaction.Item] {
        let useCase = TransactionCategoryFilterUseCase(transactionItems: items, category: category)
        return useCase.execute()
    }
    
    private func calculateTotal() -> Double {
        let useCase = TransactionTotalUseCase(items: transaction.filteredItems)
        return useCase.execute()
    }
    
}
