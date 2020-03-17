import Foundation

struct Constant {
    static let salesTax = 0.1
    static let importDutyTax = 0.05
}

struct Category {
    let name: String
    let isExemptedFromSalesTax: Bool
}

let book = Category(name: "Book", isExemptedFromSalesTax: false)
let food =  Category(name: "Food", isExemptedFromSalesTax: false)
let chocolate = Category(name: "Chocolate", isExemptedFromSalesTax: true)
let stationary = Category(name: "Stationary", isExemptedFromSalesTax: false)

struct Product {
    let id: String = UUID().uuidString
    let name: String
    let isImported: Bool
    var price: Double
    let category: Category
    var calculateTax: Double {
        if category.isExemptedFromSalesTax && isImported {
            return price * (Constant.salesTax + Constant.importDutyTax)
        } else if category.isExemptedFromSalesTax {
            return price * Constant.salesTax
        } else if isImported {
            return price * Constant.importDutyTax
        } else {
            return 0.0
        }
    }
}

extension Product: Equatable {
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.id == rhs.id
    }
}

let swiftBook = Product(name: "Learning Swift", isImported: true, price: 1050.0, category: book)
let pizza = Product(name: "pizza", isImported: true, price: 100.0, category:food )
let cadbury = Product(name: "Cadbury", isImported: false, price: 150.0, category: chocolate)
let ferreroRocher = Product(name: "Ferrero Rocher", isImported: true, price: 390.0, category:chocolate)
let highlighter = Product(name: "Highlighter", isImported: false, price: 90.0, category: stationary)
let pen = Product(name: "Fountain pen", isImported: true, price: 200.0, category: stationary)

class CartItem {
    let product: Product
    private(set) var quantity: Int
    
    init(product: Product, quantity: Int) {
        self.product = product
        self.quantity = quantity
    }
    
    func increaseQuantity() {
        quantity += 1
    }
    
    func decreaseQuantity() {
        quantity -= 1
    }
}

class Cart {
    private var availableProducts = [swiftBook, pizza, cadbury, ferreroRocher, highlighter, pen]
    private var shopingCart = [CartItem]()
    static let shared = Cart()
    private init() {}
    
    func add(product item: Product) {
        guard availableProducts.contains(item) else {
            print("this product is not available")
            return
        }
        guard let addingItemIndex = shopingCart.firstIndex(where: { $0.product == item }) else {
            shopingCart.append(CartItem(product: item, quantity: 1))
            return
        }
        shopingCart[addingItemIndex].increaseQuantity()
    }
    
    func remove(product item: Product) {
        guard let removingItemIndex = shopingCart.firstIndex(where: { $0.product == item }) else {
            print("add this product in your cart to remove it.")
            return
        }
        if shopingCart[removingItemIndex].quantity == 1 {
            shopingCart.remove(at: removingItemIndex)
        } else {
            shopingCart[removingItemIndex].decreaseQuantity()
        }
    }
    
    func calculateTax() {
        var totalBil = 0.0
        for cartItem in shopingCart {
            let product = cartItem.product
            let quantity = Double(cartItem.quantity)
            let totalProductPrice = quantity * product.price
            let totalTax = quantity * product.calculateTax
            totalBil += totalProductPrice + totalTax
            print("Name: \(product.name), Price: \(product.price), Qty: \(quantity), Tax: \(totalTax.rounded())")
        }
        print("Total amount to pay:",Int(totalBil.rounded()),"rupees")
    }
}

let cart = Cart.shared
cart.add(product: pizza)
cart.add(product: pizza)
cart.add(product: pizza)
cart.add(product: pizza)
cart.add(product: cadbury)
cart.add(product: highlighter)
cart.add(product: cadbury)
cart.remove(product: swiftBook)
cart.add(product: swiftBook)
cart.remove(product: swiftBook)
cart.add(product: ferreroRocher)
cart.calculateTax()

