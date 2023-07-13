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
                    ZStack {
                        Rectangle()
                            .fill(LinearGradient(colors: [.yellow, .orange, .red, .purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                        VStack {
                            HStack {
                                Text("Debit")
                                    .padding(.horizontal, 15)
                                    .font(.headline)
                                Spacer()
                                Image(.visaLogoWhite)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 66)
                            }

                            HStack {
                                Text("12 345.67")
                                    .font(.title2)
                                    .bold()
                                Text("USD")
                                    .opacity(0.6)
                                    .bold()
                                    .font(.title2)
                                Spacer()
                            }
                            .padding(.horizontal, 15)
                            .padding(.bottom, 10)

                            Spacer()
                            
                            HStack {
                                Text("Holder Name")
                                    .font(.headline)
                                Spacer()
                            }
                            .padding(.horizontal, 15)
                            
                            ZStack {
                                Rectangle()
                                    .frame(height: 55)
                                HStack {
                                    Text("1234 5678 9012 3456")
                                    Spacer()
                                    Text("02/29")
                                    Spacer()
                                    Text("***")
                                }
                                .padding(.horizontal, 15)
                                .foregroundStyle(.white)
                                .font(.subheadline)
                                .bold()
                            }
                        }
                    }
                    .frame(
                        width: UIScreen.main.bounds.width * 0.9,
                        height: UIScreen.main.bounds.width * 0.5
                    )
                    .padding(.vertical, 10)
                    .padding(.bottom, 40)

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
                            Text("Last Transaction")
                                .font(.headline)
                                .bold()
                            Spacer()
                            Text("View all")
                                .foregroundStyle(.purple)
                                .font(.subheadline)
                        }

                        HStack {
                            Text("Today")
                                .foregroundStyle(.gray)
                                .bold()
                            Spacer()
                            VStack { Divider() }
                        }
                        .padding(.top, 5)
                        .padding(.bottom, 15)

                        HStack {
                            Image(systemName: "apple.logo")
                                .font(.title2)
                                .padding(.horizontal, 15)
                                .background {
                                    Circle()
                                        .fill(Color(red: 0.8, green: 0.8, blue: 0.8))
                                        .frame(width: 50, height: 50)
                                }
                            VStack(spacing: 5) {
                                Text("Apple Store")
                                    .font(.headline)
                                Text("11:45 • Pending")
                                    .font(.caption)
                                    .bold()
                            }
                            Spacer()
                            HStack(spacing: 3) {
                                Text("-120.45")
                                Text("USD")
                                    .foregroundStyle(.gray)
                            }
                            .font(.subheadline)
                            .bold()
                        }

                    }

                }
            }
            .padding(.horizontal, 25)
        }
    }
}

#Preview {
    CardScreenView()
}
