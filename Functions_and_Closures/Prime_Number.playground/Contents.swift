
func primeUpto(count n: Int) -> [Int] {
    let max = n * 20
    var primeArray = [Int]()
    if n < 1 || n > 1_00_000 {
        return []
    }
    var array: [Bool] = Array(repeating: true, count: max + 1)
    for i in stride(from: 2, through: max, by: 1) {
        if array[i] == true {
            primeArray.append(i)
            if primeArray.count ==  n {
                break
            }
            for j in stride(from: i * i, through: max, by: i) {
                array[j] = false
            }
        }
    }
    return primeArray
}

let result = primeUpto(count:-1)
print(result.count != 0 ? result : "Enter the count Between 1 to 1_00_000.")
