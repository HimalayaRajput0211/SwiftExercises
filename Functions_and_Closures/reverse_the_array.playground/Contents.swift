
func reverse(_ array: [Int]) -> [Int] {
    var newArray = [Int]()
    if !array.isEmpty {
        for i in stride(from: array.count - 1, through: 0, by: -1) {
            newArray.append(array[i])
        }
    }
    return newArray
}

let array: [Int] = [123456,10000000000000]
print(reverse(array))
