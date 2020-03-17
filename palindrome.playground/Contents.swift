extension String {
    
    func isPalindrome() -> Bool {
        guard !isEmpty else {
            print("Please provide an input")
            return false
        }
        for i in 0..<count/2 {
            let leftIndex = index(startIndex, offsetBy: i)
            let rightIndex = index(index(before: endIndex), offsetBy: -i)
            guard self[leftIndex] == self[rightIndex] else {
                print("Input string is not a palindrome")
                return false
            }
        }
        print("Input string is a palindrome")
        return true
    }
    
}

let result = "aabbaa".isPalindrome()
