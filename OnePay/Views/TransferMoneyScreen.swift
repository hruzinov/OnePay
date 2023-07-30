//
//  Created by Evhen Gruzinov on 29.07.2023.
//

import SwiftUI

struct TransferMoneyScreen: View {
    @Environment(\.dismiss) var dismiss
    @State var transferSum: Double = 0
    @State var transferCardNumber: String = ""
    @State var transferPhoneNumber: String = ""
    @State var countryCode: PhoneCountryCodes = .ua
    @State var moneySendState: SendMoneyStates = .ready

    let sumFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.maximumIntegerDigits = 8
        return formatter
    }()

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .padding(.horizontal, 25)
                            .background {
                                Circle()
                                    .fill(Color(.ultraLightGray))
                                    .frame(width: 45, height: 45)
                            }
                    }

                    Spacer()
                    Text("Send Money")
                        .font(.title2)
                        .bold()
                    Spacer()
                    Image(systemName: "person.badge.plus")
                        .font(.title2)
                        .padding(.horizontal, 25)
                        .background {
                            Circle()
                                .fill(Color(.ultraLightGray))
                                .frame(width: 45, height: 45)
                        }
                }
                .padding(10)

                HStack {
                    Spacer()
                    TextField("1000", value: $transferSum, formatter: sumFormatter)
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 48))
                        .frame(width: transferSum != 0 ? CGFloat(30 * String(transferSum).count) : 30)
                    Text("EUR")
                        .font(.title3)
                        .opacity(0.6)
                    Spacer()
                }
                .bold()
                .padding(.bottom, 35)

                Text("Recipient phone number")
                    .font(.title3)
                    .bold()

                HStack {
                    Menu {
                        Picker(selection: $countryCode) {
                            ForEach(PhoneCountryCodes.allCases, id: \.self) { value in
                                Text(value.rawValue)
                                    .tag(value)
                            }
                        } label: {}
                    } label: {
                        Text(countryCode.rawValue)
                            .font(.title)
                    }.id(countryCode)
                        .padding(5)
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color(.ultraLightGray))
                        }
                    TextField("123 456 789", text: $transferPhoneNumber)
                        .frame(width: 175)
                        .keyboardType(.phonePad)
                        .font(.title)
                        .multilineTextAlignment(.center)
                }
                .font(.title)
                .bold()
                .onChange(of: transferPhoneNumber) { _, _ in
                    var newValue = transferPhoneNumber
                            .filter("+1234567890".contains)
                    switch countryCode {
                        case .ua:
                            if newValue.prefix(4) == "+380" {
                                newValue = String(newValue.dropFirst(4))
                            }
                        case .pl:
                            if newValue.prefix(3) == "+48" {
                                newValue = String(newValue.dropFirst(3))
                            }
                        case .cz:
                            if newValue.prefix(4) == "+420" {
                                newValue = String(newValue.dropFirst(4))
                            }
                    }

                    while newValue.count > 9 {
                        newValue = String(newValue.dropLast())
                    }

                    moneySendState = .ready
                    transferPhoneNumber = newValue
                }
                Spacer()

                Button {
                    if moneySendState == .ready || moneySendState == .rejected {
                        withAnimation {
                            moneySendState = .checking
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            if transferPhoneNumber.count < 9 {
                                withAnimation {
                                    moneySendState = .rejected
                                }
                            } else {
                                withAnimation {
                                    moneySendState = .complete
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                        dismiss()
                                    }
                                }
                            }
                        }
                    }
                } label: {
                    HStack {
                        switch moneySendState {
                        case .ready:
                            Text("Send")
                            Image(systemName: "arrow.right")
                        case .checking:
                            Text("Wait...")
                        case .rejected:
                            Text("Check data")
                            Image(systemName: "x.circle")
                        case .complete:
                            Text("Sended")
                            Image(systemName: "checkmark.circle")
                        }
                    }
                    .frame(width: 225, height: 55, alignment: .center)
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.white)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.black)
                    }
                }
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }

    enum PhoneCountryCodes: String, CaseIterable {
        case ua = "🇺🇦 +380"
        case pl = "🇵🇱 +48"
        case cz = "🇨🇿 +420"
    }
    enum SendMoneyStates {
        case ready
        case checking
        case rejected
        case complete
    }
}

#Preview {
    TransferMoneyScreen()
}
