func makeIncrementer(_ incrementAmount: Int ) -> ((Int) -> Int) {
    return { incrementAmount + $0 }
}

let tenIncrementer = makeIncrementer(10)
print(tenIncrementer(10))
print(tenIncrementer(3))

