class Customer {
    private static var count = 0
    private var name: String
    private var accountNo: Int
    private var balance: Double
    
    init?(name: String)  {
        guard !name.isEmpty else {
            return nil
        }
        self.name = name
        self.balance = 1000
        Customer.count += 1
        self.accountNo = Customer.count
    }
    
    func deposit(_ amount: Double) {
        guard isValidAmount(amount) else { return }
        balance += amount
        print("Successfully deposited \(amount) rupees. Your available balance is: \(balance)")
    }
    
    func withdraw(_ amount: Double) {
        guard isValidAmount(amount) else { return }
        guard amount < balance else {
            print("Insufficient balance. Available balance is: \(balance)")
            return
        }
        balance -= amount
        print("Successfully withdrawn \(amount) rupees. Your available balance is: \(balance)")
    }
    
    private func isValidAmount(_ value: Double) -> Bool {
        guard value > 0.0 else {
            print("Invalid amount. Amount should be greater than zero.")
            return false
        }
        guard value < 4_00_000.0  else {
            print("Invalid amount. Amount should be less than 4 lakhs.")
            return false
        }
        return true
    }
}

let customer1 = Customer(name: "h")
if let customer = customer1 {
    customer.deposit(-40000)
    customer.withdraw(30000)
    customer.deposit(0)
} else {
    print("Initialization failed due to invalid name. Name should not be empty.")
}


