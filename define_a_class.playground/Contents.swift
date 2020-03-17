@propertyWrapper
struct MaximumAge {
    private var age: Int = 0
    var wrappedValue: Int {
        get {
            return age
        } set {
            age = min(newValue, 30)
        }
    }
}

class Student {
    enum AdmissionType: String {
        case regular, notRegular, unknown
    }
    
    private let id: Int
    var firstName: String
    var lastName: String
    private var fullName: String {
        return firstName + " " + lastName
    }
    private let admissionType: AdmissionType
    @MaximumAge var age: Int
    
    init(id: Int, firstName: String, lastName: String, admissionType: AdmissionType, age: Int) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.admissionType = admissionType
        self.age = age
    }
    
    convenience init(id: Int) {
        self.init(id: id, firstName: "Unknown", lastName: "", admissionType: .unknown, age: 30)
    }
    
    func showDetails() {
        print("Student_Id: \(id), Student_Name: \(fullName), Student_Age: \(age), Admission_Type: \(admissionType.rawValue)")
    }
}

let student1 = Student(id: 12, firstName: "Himalaya", lastName: "Rajput", admissionType: .regular, age: 20)
student1.showDetails()
let student2 = Student(id: 23, firstName: "Raja", lastName: "Misra", admissionType: .notRegular, age: 40)
student2.age = 78
student2.showDetails()
let student3 = Student(id: 20)
student3.showDetails()

