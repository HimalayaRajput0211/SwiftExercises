class Vehicle {
    private let name: String
    var price: Double = 0 {
        didSet {
            if self.price < 0 {
                print("price cannot be a negative value.")
                self.price = oldValue
            }
        }
    }
    
    init(name: String, price: Double) {
        self.name = name
        guard price > 0 else {
            return
        }
        self.price = price
    }
    
    func showDetails() {
        print("Vehicle Name: \(name), Vehicle Price: Rs \(price), ", terminator: "")
    }
    
}

class Bike: Vehicle {
    private let dealer: String
    
    init(name: String, price: Double, dealer: String) {
        self.dealer = dealer
        super.init(name: name, price: price)
    }
    
    override func showDetails() {
        super.showDetails()
        print("Dealer: \(dealer)")
    }
}

let ktm = Bike(name: "KTM r-390", price: -1.6, dealer: "random guy")
ktm.price = 2000.9990
ktm.price = -0.8
ktm.showDetails()


