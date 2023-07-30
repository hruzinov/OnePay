//
//  Created by Evhen Gruzinov on 29.07.2023.
//

import SwiftUI

struct CardsUIView: View {
    var body: some View {
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
                    Text("EUR")
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
    }
}

#Preview {
    CardsUIView()
}
