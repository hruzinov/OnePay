//
//  Created by Evhen Gruzinov on 29.07.2023.
//

import Foundation

let exampleStartingDate = Date.parse("2021/1/1")
let exampleEndingDate = Date.parse("2024/12/31")

let exampleShopNames = [
    "The Crafted Corner",
    "The Fashion Fusion",
    "Sweet Delights Bakery",
    "TechHub Electronics",
    "The Green Thumb Garden Center",
    "Fresh and Fit Grocery",
    "The Artisan’s Workshop",
    "The Bookworm’s Haven",
    "Heavenly Scents Candle Shop",
    "The Sports Zone",
    "Trendy Threads Boutique",
    "The Music Spot",
    "Gourmet Delights Market",
    "Vintage Treasures Emporium",
    "The Pet Paradise",
    "Beauty Bliss Cosmetics",
    "The Coffee Cozy",
    "Urban Outfitters",
    "Health Haven Pharmacy",
    "The Toy Box"
]

let currentUserID = UUID()
let currentAccountID = UUID()

extension Transaction {
    static func randomExample() -> Transaction {
        return Transaction(
            id: UUID(), userID: currentUserID, accountID: currentAccountID, type: TransactionType.allCases.randomElement()!,
            category: TransactionCategory.allCases.randomElement()!, date: Date.randomBetween(start: exampleStartingDate,
            end: exampleEndingDate),state: TransactionState.allCases.randomElement()!, shopName: exampleShopNames.randomElement()!,
            sum: Int.random(in: -1000000...1000000)
        )
    }
    static func randomExampleDict(_ count: Int) -> [String:[Transaction]] {
        var array = [Transaction]()
        for _ in 1...count {
            array.append(randomExample())
        }
        let dictionary = Dictionary(grouping: array.sorted(by: {$0.date > $1.date}), by: { $0.date.dateString() })
        return dictionary
    }
}
