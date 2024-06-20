import UIKit

struct Account {
    var title: String
    var amount: Int
    var isCredit: Bool
    var isMain: Bool
    var transactions: [String] = []
    
    init(titleAccount: String, amountOfMoney: Int, isCredit: Bool = false, isMain: Bool = false) {
            self.title = titleAccount
            self.amount = amountOfMoney
            self.isCredit = isCredit
            self.isMain = isMain
        }
}

class Bank {
    private var accounts: [Account] = [
        Account(titleAccount: "main account", amountOfMoney: 100, isMain: true),
        Account(titleAccount: "credit account", amountOfMoney: 100000, isCredit: true)
    ]
    
    //MARK: - Работа со счетом
    func createAccount(title: String, deposit: Int) {
        let lowerTitle = title.lowercased()
        if !checkAccount(title: lowerTitle) {
            var newAccount = Account(titleAccount: lowerTitle, amountOfMoney: deposit)
            newAccount.transactions.append("Счет создан с депозитом: \(deposit) рублей")
            accounts.append(newAccount)
            print("Вы успешно создали счет \(title). Ваш баланс - \(deposit) рублей")
        } else {
            print("Вы не можете создать счет с названием \(title), так как с таким названием счет уже существует. Пожалуйста, выберите другое название.")
        }
    }
    
    func seeCountAccounts() {
        let accountCount = accounts.count
        let countDescription: String

        switch accountCount {
        case 1:
            countDescription = "счет"
        case 2...4:
            countDescription = "счета"
        default:
            countDescription = "счетов"
        }

        print("У вас \(accountCount) \(countDescription)")
    }

    func seeTitleAccounts() {
        print("Названия ваших счетов:" + accounts.map { $0.title }.joined(separator: ","))
    }

    func allMoneyOnAccounts(withCredit: Bool) {
        var sum = 0
        for account in accounts {
            if withCredit || !account.isCredit {
                sum += account.amount
            }
        }
        if withCredit {
            print("Ваша сумма кредитных и личных средств со всех счетов - \(sum) рублей")
        } else {
            print("Ваша сумма личных средств со всех счетов - \(sum) рублей")
        }
    }

    func closeAccount(title: String) {
        let lowerTitle = title.lowercased()
        guard checkAccount(title: lowerTitle) else {
            print("У вас нет такого счета. Вызовите функцию seeTitleAccounts(), чтобы увидеть все названия ваших счетов")
            return
        }
        for i in 0..<accounts.count {
            if accounts[i].title == lowerTitle {
                if accounts[i].isMain || accounts[i].isCredit {
                    print("Вы не можете закрыть счет: \(title)")
                } else {
                    transferOfFunds(amount: accounts[i].amount)
                    accounts.remove(at: i)
                    print("Счет <\(title)> удачно закрыт. Деньги с данного счета были перенесены на главный счёт.")
                }
                break
            }
        }
    }
    //MARK: - Операции с деньгами на счету
    
    func addMoney(title: String, amount: Int) {
        let lowerTitle = title.lowercased()
        var accountFound = false
        for i in 0..<accounts.count {
            if accounts[i].title == lowerTitle {
                accounts[i].amount += amount
                accounts[i].transactions.append("Добавлено \(amount) рублей")
                accountFound = true
                print("Вы добавили \(amount) рублей на счет: \(lowerTitle). Ваш баланс - \(accounts[i].amount) рублей")
                break
            }
        }
        if !accountFound {
            print("У вас нет такого счета. Вызовите функцию seeTitleAccounts(), чтобы увидеть все названия ваших счетов")
        }
    }

    func seeCountMoney(accountTitle: String) {
        let lowerAccountTitle = accountTitle.lowercased()
        guard checkAccount(title: lowerAccountTitle) else {
            print("У вас нет такого счета. Вызовите функцию seeTitleAccounts(), чтобы увидеть все названия ваших счетов")
            return
        }
        
        for i in 0..<accounts.count {
            if accounts[i].title == lowerAccountTitle {
                print("У вас на счету \(lowerAccountTitle) - \(accounts[i].amount) рублей")
            }
        }
    }

    func withdraw(money: Int, account: String) {
        let lowerAccount = account.lowercased()
        guard checkAccount(title: lowerAccount) else {
            print("У вас нет такого счета. Вызовите функцию seeTitleAccounts(), чтобы увидеть все названия ваших счетов")
            return
        }
        for i in 0..<accounts.count {
            if accounts[i].title == lowerAccount {
                if checkBalance(account: lowerAccount, amount: money) {
                    accounts[i].amount -= money
                    accounts[i].transactions.append("Со счета снято \(money) рублей")
                    print("Вы успешно сняли \(money) рублей с \(lowerAccount). Остаток на счету \(accounts[i].amount) рублей")
                } else {
                    print("Недостаточно средств на счете \(lowerAccount) для снятия \(money). Баланс счета: \(accounts[i].amount)")
                }
            }
        }
    }

    func transferMoney(from account1: String, to account2: String, amount: Int) {
        let lowerAccount1 = account1.lowercased()
        let lowerAccount2 = account2.lowercased()
        var fromAccountIndex: Int?
        var toAccountIndex: Int?
        
        guard checkAccount(title: lowerAccount1) && checkAccount(title: lowerAccount2) else {
            print("У вас нет такого счета. Вызовите функцию seeTitleAccounts(), чтобы увидеть все названия ваших счетов")
            return
        }
        
        for i in 0..<accounts.count {
            if accounts[i].title.lowercased() == lowerAccount1 {
                fromAccountIndex = i
            } else if accounts[i].title.lowercased() == lowerAccount2 {
                toAccountIndex = i
            }
        }
        
        if let fromIndex = fromAccountIndex, let toIndex = toAccountIndex {
            if accounts[fromIndex].amount >= amount {
                accounts[fromIndex].amount -= amount
                accounts[toIndex].amount += amount
                accounts[fromIndex].transactions.append("Переведено \(amount) рублей на счет \(account2)")
                accounts[toIndex].transactions.append("Пополнение на \(amount) рублей со счета \(account1)")
                print("Перевод \(amount) рублей с \(account1) на \(account2) выполнен успешно. Баланс счета \(account1) стало - \(accounts[fromIndex].amount) рублей. Баланс счета \(account2) стало - \(accounts[toIndex].amount) рублей")
            } else {
                print("Недостаточно средств на счете \(account1) для выполнения перевода. Баланс счета  - \(accounts[fromIndex].amount) рублей")
            }
        }
    }

    func seeDebtOnCredit() {
        if let creditAccount = accounts.first(where: {$0.isCredit}) {
            let resultDebt = 100000 - creditAccount.amount
            print("Ваш кредитный лимит по карте: 100.000 рублей. Ваша задолжность на данный момент составляет - \(resultDebt) рублей")
        }
    }
    
    func showTransactions(title: String) {
        let lowerTitle = title.lowercased()
        guard checkAccount(title: lowerTitle) else {
            print("У вас нет такого счета. Вызовите функцию seeTitleAccounts(), чтобы увидеть все названия ваших счетов")
            return
        }
        
        for account in accounts {
            if account.title == lowerTitle {
                print("История транзакций для \(title):")
                for transaction in account.transactions {
                    print(transaction)
                }
            }
        }
    }
    
    //MARK: - Приватые операции
    private func checkBalance(account: String, amount: Int) -> Bool {
        for acc in accounts {
            if acc.title == account.lowercased() {
                return acc.amount >= amount
            }
        }
        return false
    }
    
    private func transferOfFunds(amount: Int) {
        for i in 0..<accounts.count {
            if accounts[i].isMain {
                accounts[i].amount += amount
            }
        }
    }
    
    private func checkAccount(title: String) -> Bool {
        let lowerTitle = title.lowercased()
        for account in accounts {
            if account.title == lowerTitle {
                return true
            }
        }
        return false
    }
}

let bank = Bank()
bank.createAccount(title: "Saving account", deposit: 1000)
bank.createAccount(title: "Saving account", deposit: 1000)
bank.seeCountAccounts()
bank.seeTitleAccounts()
bank.allMoneyOnAccounts(withCredit: true)
bank.allMoneyOnAccounts(withCredit: false)
bank.addMoney(title: "aving account", amount: 1000)
bank.addMoney(title: "Saving account", amount: 1000)
bank.closeAccount(title: "aving account")
bank.closeAccount(title: "main account")
bank.closeAccount(title: "Saving account")
bank.seeCountMoney(accountTitle: "main account")
bank.createAccount(title: "Salary account", deposit: 40000)
bank.seeCountMoney(accountTitle: "Salary account")
bank.seeDebtOnCredit()
bank.withdraw(money: 40000, account: "ain account")
bank.withdraw(money: 40000, account: "Salary account")
bank.withdraw(money: 40000, account: "main account")
bank.transferMoney(from: "Salary account", to: "main account", amount: 100)
bank.transferMoney(from: "main account", to: "Salary account", amount: 100)
bank.transferMoney(from: "main account", to: "Salary account", amount: 2100)
bank.transferMoney(from: "main account", to: "alary account", amount: 2100)
bank.showTransactions(title: "main account")
bank.showTransactions(title: "Salary account")
bank.showTransactions(title: "ain account")
bank.withdraw(money: 100000, account: "credit account")
bank.seeDebtOnCredit()
