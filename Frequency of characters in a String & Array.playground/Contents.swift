
func frequencyOfCharacters(string: String) {
    guard string.count > 0 else {
        print("empty string")
        return
    }
    var dict: [Character: Int] = [:]
    for character in string {
        switch character {
        case " ":
            break
        default:
            dict[character, default: 0] += 1
        }
    }
    for (key, value) in dict {
        print("\"\(key)\" => \(value)")
    }
}

func frequencyOfCharacters(string array: [Character]) {
    guard array.count > 0 else {
        print("empty array")
        return
    }
    frequencyOfCharacters(string: String(array))
}

frequencyOfCharacters(string: "")


