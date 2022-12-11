import UIKit

enum Currency: String {
    case BGN
    case USD
    case EUR
}

struct Card {
    var PIN: String
    var owner: String
    var cardAccount: [String: Double]
    
    func printCardBalance() {
        print("Card balance \(cardAccount)")
    }
}

struct ATM {
    var ID: String
    var availabilityInATM:[String: Double]
    var currencyFee: Double
    
    mutating func withdrawMoney(card: Card, amount: Double, pin: String) -> [String: Double] {
        
        if pin != card.PIN {
           print("Грешен PIN код!")
            return card.cardAccount
        }
        
        if self.availabilityInATM[Currency.BGN.rawValue] ?? 0.0 < amount {
            print("Недостатъчна наличност в банкомата!")
            return card.cardAccount
        }
        
        var totalBalanceCard = 0.0
        card.cardAccount.forEach({totalBalanceCard += $0.value})
        

        if totalBalanceCard < amount {
            print("Недостатъчна наличност по вашата сметка!")
            return card.cardAccount
        }
        var currentAmount = amount
        var currentCardAccounts = card.cardAccount
        availabilityInATM[Currency.BGN.rawValue] = self.availabilityInATM[Currency.BGN.rawValue] ?? 0.0 - currentAmount
        for currencyName in card.cardAccount.keys {
            switch Currency(rawValue: currencyName) {
            case .BGN:
                if currentCardAccounts[Currency.BGN.rawValue] ?? 0.0 >= currentAmount {
                    currentCardAccounts[Currency.BGN.rawValue] = (currentCardAccounts[Currency.BGN.rawValue] ?? 0.0) - currentAmount
                    return currentCardAccounts
                } else {
                    currentCardAccounts[Currency.BGN.rawValue] = (currentCardAccounts[Currency.BGN.rawValue] ?? 0.0) -
                    (currentCardAccounts[Currency.BGN.rawValue] ?? 0.0)
                    currentAmount = currentAmount - (currentCardAccounts[Currency.BGN.rawValue] ?? 0.0)
                }
            case .EUR:
                if currentCardAccounts[Currency.EUR.rawValue] ?? 0.0 * 1.956 >= currentAmount {
                    currentCardAccounts[Currency.EUR.rawValue] = (currentCardAccounts[Currency.EUR.rawValue] ?? 0.0) - (currentAmount
                    / 1.956)
                    return currentCardAccounts
                } else {
                    currentCardAccounts[Currency.EUR.rawValue] = (currentCardAccounts[Currency.EUR.rawValue] ?? 0.0) -
                    (currentCardAccounts[Currency.EUR.rawValue] ?? 0.0)
                    currentAmount = currentAmount - ((currentCardAccounts[Currency.EUR.rawValue] ?? 0.0) * 1.956)
                }
            case .USD:
                if currentCardAccounts[Currency.USD.rawValue] ?? 0.0 * 1.858 >= currentAmount {
                    currentCardAccounts[Currency.USD.rawValue] = (currentCardAccounts[Currency.USD.rawValue] ?? 0.0) - (currentAmount
                    / 1.858)
                    return currentCardAccounts
                } else {
                    currentCardAccounts[Currency.USD.rawValue] = (currentCardAccounts[Currency.USD.rawValue] ?? 0.0) -
                    (currentCardAccounts[Currency.USD.rawValue] ?? 0.0)
                    currentAmount = currentAmount - ((currentCardAccounts[Currency.USD.rawValue] ?? 0.0) * 1.858)
                }
            default:
                break
            }
        }
        
        return card.cardAccount
    }
    func printATMBalance() {
        print(self.availabilityInATM[Currency.BGN.rawValue])
    }
}

// Example 1
print("Example 1")
var atm = ATM(ID: "1337", availabilityInATM: [Currency.USD.rawValue: 0.0, Currency.BGN.rawValue: 20.0, Currency.EUR.rawValue: 0.0], currencyFee: 0.0)
var card = Card(PIN: "6854", owner: "Yulian Videnov", cardAccount: [Currency.USD.rawValue: 0.0, Currency.EUR.rawValue: 0.0, Currency.BGN.rawValue: 80.0])

card.cardAccount = atm.withdrawMoney(card: card, amount: 20, pin: "6854")
print(atm.printATMBalance())
print(card.printCardBalance())

// Example 2
print("Example 2")
atm.availabilityInATM[Currency.BGN.rawValue] = 100.0
card.cardAccount = [Currency.USD.rawValue: 0.0, Currency.EUR.rawValue: 0.0, Currency.BGN.rawValue: 80.0]

card.cardAccount = atm.withdrawMoney(card: card, amount: 80.0, pin: "6854")
print(atm.printATMBalance())
print(card.printCardBalance())

// Example 3
print("Example 3")
atm.availabilityInATM[Currency.BGN.rawValue] = 100.0
card.cardAccount = [Currency.USD.rawValue: 0.0, Currency.EUR.rawValue: 0.0, Currency.BGN.rawValue: 80.0]

card.cardAccount = atm.withdrawMoney(card: card, amount: 90.0, pin: "6854")
print(atm.printATMBalance())
print(card.printCardBalance())

// Example 4
print("Example 4")
atm.availabilityInATM[Currency.BGN.rawValue] = 60.0
card.cardAccount = [Currency.USD.rawValue: 0.0, Currency.EUR.rawValue: 0.0, Currency.BGN.rawValue: 80.0]

card.cardAccount = atm.withdrawMoney(card: card, amount: 80.0, pin: "6854")
print(atm.printATMBalance())
print(card.printCardBalance())

// Example 5
print("Example 5")
atm.availabilityInATM[Currency.BGN.rawValue] = 100.0
card.cardAccount = [Currency.USD.rawValue: 0.0, Currency.EUR.rawValue: 60.0, Currency.BGN.rawValue: 80.0]

card.cardAccount = atm.withdrawMoney(card: card, amount: 100.0, pin: "6854")
print(atm.printATMBalance())
print(card.printCardBalance())

// Example 6
print("Example 6")
atm.availabilityInATM[Currency.BGN.rawValue] = 400.0
card.cardAccount = [Currency.USD.rawValue: 0.0, Currency.EUR.rawValue: 60.0, Currency.BGN.rawValue: 80.0]

card.cardAccount = atm.withdrawMoney(card: card, amount: 150.0, pin: "6854")
print(atm.printATMBalance())
print(card.printCardBalance())
