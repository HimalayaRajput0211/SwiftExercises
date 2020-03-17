func minmax(_ a: Int, _ b: Int) -> (min: Int, max: Int) {
    return a > b ? (b, a) : (a, b)
}
let result = minmax(2, 3)
print("minimum: \(result.min), maximum: \(result.max)")

