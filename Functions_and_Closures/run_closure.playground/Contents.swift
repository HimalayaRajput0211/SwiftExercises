
func logger(closure: () -> Void) {
    print("Running MyFunc")
    closure()
    print("MyFunc Done!")
}

logger {
    print(".....")
    print(".....")
}

