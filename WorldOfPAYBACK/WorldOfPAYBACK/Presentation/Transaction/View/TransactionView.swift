//
//  TransactionView.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import SwiftUI

struct TransactionView: View {
    
    @StateObject var viewModel = TransactionViewModel(repo: DemoTransactionRepo())
    
    var body: some View {
        VStack {
            List {
                Section {
                    TransactionItemsView(items: $viewModel.transaction.filteredItems)
                } header: {
                    TransactionAttributeView(sortType: $viewModel.selectedSortType, category: $viewModel.selectedCategory)
                }
            }
            .listStyle(.plain)
            .refreshable(action: viewModel.onPullToRefresh)
            TransactionTotalView(transaction: $viewModel.transaction)
        }
        .overlay(content: {
            CircularProgressView(show: $viewModel.showProgress)
            BannerView(data: $viewModel.bannerData, show: $viewModel.showBanner)
            ErrorView(data: $viewModel.errorViewData, show: $viewModel.showErrorView) {
                self.viewModel.onErrorViewAction()
            }
        })
        .navigationTitle(.localized(.transaction))
    }
    
}

fileprivate struct TransactionAttributeView: View {
    
    @Binding var sortType: TransactionSortUseCase.SortType
    @Binding var category: Transaction.Item.Category
    
    var body: some View {
        HStack {
            Spacer()
            MenuView<TransactionSortUseCase.SortType>(selected: $sortType)
            Spacer()
            MenuView<Transaction.Item.Category>(selected: $category)
            Spacer()
        }
        .padding(5)
    }
}

fileprivate struct TransactionItemsView: View {
    
    @Binding var items: [Transaction.Item]
    
    var body: some View {
        ForEach($items, id: \.id) { item in
            NavigationLink {
                TransactionDetailsView(item: item.wrappedValue)
            } label: {
                TransactionItemView(item: item)
                    .padding(5)
            }
        }
    }
}

fileprivate struct TransactionItemView: View {
    
    @Binding var item: Transaction.Item
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5, content: {
            HStack {
                Text(item.transactionDetail.bookingDateOnly)
                    .subHeadline()
                Spacer()
                Text(item.transactionDetail.bookingTimeOnly)
                    .captionLight()
            }
            HStack {
                VStack(alignment: .leading, content: {
                    Text(item.partnerDisplayName)
                        .caption()
                    Text(item.transactionDetail.description)
                        .captionLight()
                })
                Spacer()
                Text(item.transactionDetail.value.amountString)
                    .primarySubHeadline()
                Text(item.transactionDetail.value.currency.rawValue)
                    .captionLight()
            }
            .frame(maxWidth: .infinity)
        })
    }
}

fileprivate struct TransactionTotalView: View {
    
    @Binding var transaction: Transaction
    
    var body: some View {
        if transaction.transactionTotalString.count > 0 {
            HStack() {
                Spacer()
                Text(.localized(.totalAmount))
                Text(transaction.transactionTotalString)
                    .padding(.trailing, 10)
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(Color.palette(.primary))
            .foregroundColor(.white)
        }
    }
    
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView()
    }
}
