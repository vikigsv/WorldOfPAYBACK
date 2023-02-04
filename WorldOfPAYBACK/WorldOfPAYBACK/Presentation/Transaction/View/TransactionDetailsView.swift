//
//  TransactionDetailsView.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import SwiftUI

struct TransactionDetailsView: View {
    
    @ObservedObject var viewModel: TransactionDetailsViewModel
    
    init(item: Transaction.Item) {
        viewModel = .init(item: item)
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(.localized(.partnerName))
                    .primarySubHeadline()
                Text(viewModel.item.partnerDisplayName)
                    .subHeadline()
                Spacer()
            }
            HStack {
                Text(.localized(.description))
                    .primarySubHeadline()
                Text(viewModel.item.transactionDetail.description)
                    .subHeadline()
                Spacer()
            }
            Spacer()
        }
        .padding()
        .navigationTitle(.localized(.transactionDetails))
    }
}

struct TransactionDetailsView_Previews: PreviewProvider {
    
    @State static var transactionItem: Transaction.Item = .init(partnerDisplayName: "Partner", alias: .init(), category: .a, transactionDetail: .init(value: .init()))
    
    static var previews: some View {
        TransactionDetailsView(item: transactionItem)
    }
    
}
