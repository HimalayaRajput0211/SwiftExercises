import Foundation

enum StudentRecordError: LocalizedError {
    case invalidAge, invalidFirstName
    var errorDescription: String? {
        switch self {
        case .invalidAge:
            return "Age should be grater than zero."
        case .invalidFirstName:
            return "first name cannot be a empty string."
        }
    }
}

struct Name {
    var firstName: String
    var lastName: String
    var fullName: String {
        if !lastName.isEmpty {
            return firstName + " " + lastName
        } else {
            return firstName
        }
    }
    
    init(firstName: String, lastName: String) throws {
        guard !firstName.isEmpty else {
            throw StudentRecordError.invalidFirstName
        }
        self.firstName = firstName
        self.lastName = lastName
    }
}

struct Student {
    private let id: Int
    var name: Name
    private let age: Int
    
    init(id: Int, name: Name, age: Int) throws {
        guard age > 0 else {
            throw StudentRecordError.invalidAge
        }
        self.id = id
        self.name = name
        self.age = age
    }
    
    func getDetails() {
        print("Student_id: \(id), Student_name: \(name.fullName), Student_age: \(age)")
    }
}

do {
    let student1 = try Student(id: 1, name: try Name(firstName: "Himalaya", lastName: ""), age: 56)
    student1.getDetails()
} catch {
    print(error.localizedDescription)
}


