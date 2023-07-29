//
//  Created by Evhen Gruzinov on 15.07.2023.
//

import Foundation

struct Transaction: Identifiable {
    let id: UUID
    let userID: UUID
    let accountID: UUID
    let type: TransactionType
    let category: TransactionCategory
    let date: Date
    let state: TransactionState
    let shopName: String
    let sum: Int
}

enum TransactionType: CaseIterable {
    case incomeTransfer, outcomeTransfer, localTransfer
    case offlinePayment, onlinePayment, salary, cashback, otherIncome, otherOutcome
}
enum TransactionCategory: String, CaseIterable {
    case transfer = "paperplane"
    case unknown = "questionmark"
    case groceries = "basket", cafes = "cup.and.saucer", foodDelivery = "cart" // food
    case heating = "heater.vertical", security = "shield", electricity = "lightbulb", water = "drop", gas = "flame",
         rent = "house", household = "house.lodge", communications = "phone.and.waveform.fill" // utility
    case parking = "parkingsign", fuel = "fuelpump", publicTransport = "bus", taxi = "car", avia = "airplane",
         trains = "cablecar", bus = "bus.doubledecker" // transportation
    case books = "book.closed", pets = "pawprint", clothes = "tshirt", cinema = "film", accommodation = "building",
         education = "graduationcap", sport = "sportscourt", toys = "teddybear", other = "theatermasks" // leisure
    case services = "globe", retail = "cart.fill" // online
    case healthcare = "pill", cosmetics = "swatchpalette", insurance = "checkerboard.shield"
    case cashWithdrawal = "banknote", creditCard = "creditcard.and.123", overdraft = "creditcard.circle", loans = "banknote.fill",
    fines = "creditcard", leasing = "dollarsign.arrow.circlepath", investments = "signature", savings = "dollarsign.circle",
         otherFinancial = "dollarsign" // financial
    case charity = "giftcard.fill", gifts = "giftcard", govermental = "scroll", postal = "mail" // Other categories

}
enum TransactionState: String, CaseIterable {
    case inProgress = "in progress", completed, planned, rejected, paused
}
