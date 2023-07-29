//
//  Created by Evhen Gruzinov on 11.07.2023.
//

import SwiftUI

struct CardScreenView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Image(systemName: "circle.grid.2x2")
                        .font(.title3)
                    Spacer()
                    Text("Welcome, Evhen")
                        .font(.headline)
                    Spacer()
                    Image(systemName: "bell")
                        .font(.title3)
                }
                .padding(.top, 5)
                .padding(.bottom, 15)
                .bold()

                ScrollView {
                    // Cards
                    CardsUIView()

                    // Buttons
                    HStack {
                        VStack {
                            Image(systemName: "arrow.down")
                                .font(.title3)
                                .background {
                                    Circle()
                                        .stroke(.black, lineWidth: 3)
                                        .fill(.white)
                                        .frame(width: 55, height: 55)
                                }
                                .padding(.bottom, 20)
                            Spacer()
                            Text("Top Up")
                                .font(.subheadline)
                                .bold()
                        }
                        Spacer()
                        VStack {
                            Image(systemName: "arrow.up.right")
                                .font(.title3)
                                .background {
                                    Circle()
                                        .stroke(.black, lineWidth: 3)
                                        .fill(.white)
                                        .frame(width: 55, height: 55)
                                }
                                .padding(.bottom, 20)
                            Spacer()
                            Text("Pay or Send")
                                .font(.subheadline)
                                .bold()
                        }
                        Spacer()
                        VStack {
                            Image(systemName: "qrcode")
                                .font(.title3)
                                .background {
                                    Circle()
                                        .stroke(.black, lineWidth: 3)
                                        .fill(.white)
                                        .frame(width: 55, height: 55)
                                }
                                .padding(.bottom, 20)
                            Spacer()
                            Text("Scan QR")
                                .font(.subheadline)
                                .bold()
                        }
                        Spacer()
                        VStack {
                            Image(systemName: "plus.viewfinder")
                                .font(.title3)
                                .background {
                                    Circle()
                                        .stroke(.black, style: StrokeStyle(
                                            lineWidth: 2,
                                            lineCap: .round,
                                            dash: [5, 10],
                                            dashPhase: 0
                                        ))
                                        .frame(width: 55, height: 55)
                                }
                                .padding(.bottom, 20)
                            Spacer()
                            Text("New Card")
                                .font(.subheadline)
                                .bold()
                        }
                    }
                    .padding(.horizontal, 5)
                    .padding(.bottom, 40)

                    // Transactions
                    VStack {
                        HStack {
                            Text("Last Transactions")
                                .font(.headline)
                                .bold()
                            Spacer()
                            Text("View all")
                                .foregroundStyle(.purple)
                                .font(.subheadline)
                        }

                        ForEach(Transaction.randomExampleDict(10).sorted(by: {$0.key > $1.key}), id: \.key) { date, transactionsArray in
                            VStack {
                                HStack {
                                    Text(date == Date.now.dateString() ? "Today" : date)
                                        .foregroundStyle(.gray)
                                        .bold()
                                    Spacer()
                                    VStack { Divider() }
                                }
                                .padding(.vertical, 5)

                                ForEach(transactionsArray) { transaction in
                                    TransactionListUIView(transaction: transaction)
                                        .padding(.bottom, 5)
                                }
                            }
                            .padding(.bottom, 5)
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
            .padding(.horizontal, 10)
        }
    }
}

#Preview {
    CardScreenView()
}
