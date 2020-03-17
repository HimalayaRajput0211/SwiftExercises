func getNthFibonacciNumber(_ position: Int) -> (Int, Int) {
    guard position > 0 else {
        print("please enter valid Fibonacci position.")
        return (0, 0)
    }
    guard position < 93 else {
        print("maximum capacity exceeds for this position, please enter a smaller poition.")
        return (0, 0)
    }
    var firstNumber = 1, secondNumber = 1, sum = 2
    if position > 3 {
        for _ in 4...position {
            firstNumber = secondNumber
            secondNumber = sum
            sum = firstNumber + secondNumber
        }
    }
    switch position {
    case 1:
        return (1, 1)
    case 2:
        return (2, 1)
    default:
        return (position, sum)
    }
}

let (position, value) = getNthFibonacciNumber(6)
print(value > 0 ? "Fibonacci Number at position \(position) is : \(value)" : "")
