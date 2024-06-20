import UIKit

class Person {
    var fullName: String
    var age: Int
    var passport: Passport?
    
    init(fullName: String, age: Int) {
        self.fullName = fullName
        self.age = age
        print("\(fullName) initialized")
    }
    
    deinit {
        print("\(fullName) deinitialized")
    }
}

class Passport {
    var series: Int
    var number: Int
    var dateOfIssue: String
    weak var owner: Person?
    
    init(series: Int, number: Int, dateOfIssue: String, owner: Person) {
        self.series = series
        self.number = number
        self.dateOfIssue = dateOfIssue
        self.owner = owner
        print("Passport \(series) \(number) initialized")
    }
    
    deinit {
            print("Passport \(series) \(number) deinitialized")
        }
}

class Material {
    var name: String
    var quantity: Int
    var price: Float
    
    
    init(name: String, quantity: Int, price: Float) {
        self.name = name
        self.quantity = quantity
        self.price = price
        print("Material \(name) initialized")
    }
    
    deinit {
        print("Material \(name) deinitialized")
    }
}

class BuildingMaterialsFactory {
    private var titleFactory: String
    private var customers: [Person] = []
    private var typeMaterials: [Material] = []
    
    init(title: String) {
        self.titleFactory = title
        print("Factory \(titleFactory) initialized")
    }
    func addCustomer(_ customer: Person) {
        customers.append(customer)
        print("Added customer \(customer.fullName) to factory \(titleFactory)")
    }
    func addMaterial(_ material: Material) {
        typeMaterials.append(material)
        print("Added material \(material.name) to factory \(titleFactory)")
    }
    deinit {
        print("Factory \(titleFactory) deinitialized")
    }
}

do {
    var customerIvan = Person(fullName: "Ivan Ivanov", age: 30)
    var passportInan = Passport(series: 1234, number: 567890, dateOfIssue: "23.10.2008", owner: customerIvan)
    customerIvan.passport = passportInan
    
    let customerPetr = Person(fullName: "Petr Petrov", age: 25)
    let passportPetr = Passport(series: 4321, number: 098765, dateOfIssue: "23.10.2003", owner: customerPetr)
    customerPetr.passport = passportPetr
    
    
    let material1 = Material(name: "Concrete", quantity: 100, price: 10.69)
    let material2 = Material(name: "Bricks", quantity: 200, price: 20.99)
    let material3 = Material(name: "Steel", quantity: 50, price: 1000)
    
    
    var liderFactory = BuildingMaterialsFactory(title: "Lider")
    liderFactory.addCustomer(customerIvan)
    liderFactory.addCustomer(customerPetr)
    liderFactory.addMaterial(material1)
    liderFactory.addMaterial(material2)
    liderFactory.addMaterial(material3)
}
