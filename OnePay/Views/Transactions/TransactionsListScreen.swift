//
//  TransactionsListScreen.swift
//  OnePay
//
//  Created by Evhen Gruzinov on 29.07.2023.
//

import SwiftUI

struct TransactionsListScreen: View {
    var transactions: [Transaction]

    var body: some View {
        ScrollView {
            TransactionsListUIView(transactions: transactions)
                .padding(.horizontal, 10)
        }
    }
}

#Preview {
    TransactionsListScreen(transactions: Transaction.randomExampleArr(25))
}
