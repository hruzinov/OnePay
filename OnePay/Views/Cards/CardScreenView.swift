//
//  Created by Evhen Gruzinov on 11.07.2023.
//

import SwiftUI

struct CardScreenView: View {
    @State var transactions = Transaction.randomExampleArr(50)

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
                .padding(.top, 10)
                .padding(.horizontal, 10)
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
                        NavigationLink {
                            TransferMoneyScreen()
                        } label: {
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
                            NavigationLink {
                                TransactionsListScreen(transactions: transactions)
                            } label: {
                                Text("View all")
                                    .foregroundStyle(.purple)
                                    .font(.subheadline)
                            }
                        }
                        
                        TransactionsListUIView(transactions: transactions)
                    }
                }
            }
            .padding(.horizontal, 10)
        }
    }
}

#Preview {
    CardScreenView()
}
