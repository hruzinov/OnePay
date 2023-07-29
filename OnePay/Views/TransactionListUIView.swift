//
//  Created by Evhen Gruzinov on 29.07.2023.
//

import SwiftUI

struct TransactionListUIView: View {
    @State var transaction: Transaction

    var body: some View {
        HStack {
            Image(systemName: transaction.category.rawValue)
//                .aspectRatio(1, contentMode: .fit)
                .font(.title2)
                .padding(.horizontal, 15)
                .background {
                    Circle()
                        .fill(Color(red: 0.8, green: 0.8, blue: 0.8))
                        .frame(width: 50, height: 50)
                }
                .frame(width: 55, height: 55)

            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(transaction.shopName)
                        .font(.headline)
                    Text("\(transaction.date.dateString("hh:mm")) • \(transaction.state.rawValue.capitalized)")
                        .font(.caption)
                        .bold()
                }
                Spacer()
            }
            .frame(maxWidth: .infinity)
            Spacer()
            HStack(spacing: 3) {
                Text(String(Double(transaction.sum) / 100))
                Text("USD")
                    .foregroundStyle(.gray)
            }
            .font(.subheadline)
            .bold()
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    TransactionListUIView(transaction: Transaction.randomExample())
}
