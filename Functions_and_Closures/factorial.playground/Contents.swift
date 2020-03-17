
func factorial(_ n: Int) {
    guard n >= 0 else {
        print("value should be whole numbers only.")
        return
    }
    var array:[Int] = [1]
    if n > 1 {
        for x in 2...n {
            multiple(x: x, array: &array)
        }
    }
    for i in stride(from: array.count - 1, through: 0, by: -1) {
        print(array[i], separator: "", terminator: "")
    }
}

func multiple(x: Int, array: inout [Int]) {
    var carry: Int = 0
    for i in 0..<array.count {
        let product = array[i] * x + carry
        array[i] = product % 10
        carry = product / 10
    }
    while(carry != 0) {
        array.append(carry % 10)
        carry = carry/10
    }
}

factorial(-1)
