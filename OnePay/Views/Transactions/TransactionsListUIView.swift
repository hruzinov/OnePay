//
//  Created by Evhen Gruzinov on 29.07.2023.
//

import SwiftUI

struct TransactionsListUIView: View {
    var transactions: [Transaction]
    var transactionsDictionary: [String: [Transaction]] {
        Dictionary(grouping: transactions, by: { $0.date.dateString() })
    }

    var body: some View {
        VStack {
            ForEach(transactionsDictionary.sorted(by: {$0.key > $1.key}), id: \.key) { date, transactionsArray in

                HStack {
                    Text(date == Date.now.dateString() ? "Today" : date)
                        .foregroundStyle(.gray)
                        .bold()
                    Spacer()
                    VStack { Divider() }
                }
                .padding(.vertical, 5)

                ForEach(transactionsArray) { transaction in
                    TransactionUIView(transaction: transaction)
                        .padding(.bottom, 5)
                }

                .padding(.bottom, 5)
            }
        }
    }
}

#Preview {
    TransactionsListUIView(transactions: Transaction.randomExampleArr(5))
}
