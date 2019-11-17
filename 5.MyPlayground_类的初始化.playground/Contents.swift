import UIKit

// var str = "Hello, playground"

class Person {
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    convenience init() {
        self.init(name: "[Unnamed]", age: 0)
    }
}

class Teacher: Person {
    var salary: Int

    override init(name: String, age: Int) {
        salary = 5000
        super.init(name: name, age: age)
    }

    init(name: String, age: Int, salary: Int) {
        self.salary = salary
        super.init(name: name, age: age)
        self.name = self.name + "老师"
    }

    convenience init(salary: Int) {
//        test()
        self.init(name: "joe", age: 30, salary: salary)
        self.salary = self.salary + 1000
        test()
    }

    func test() {
        print("teacher test()")
    }
}

// MARK: - 类的继承

/// 抽象类
class Vehicle {
    var currentSpeed: Int = 0
    var desc: String {
        return "run at speed \(currentSpeed)"
    }

    func makeNoise() {
    }
}

class Car: Vehicle {
    var gear: Int = 0

    override var desc: String {
        return super.desc + "at gear \(gear)"
    }
}

var car = Car()
car.gear = 3
car.currentSpeed = 30
print(car.desc)

// MARK: - 类的多态和类型转换

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let array = [Movie(name: "movieName", director: "movieDirector"), Song(name: "SongName", artist: "333")]

print(type(of: array))

for item in array {
    if let realItem = item as? Movie {
        print(realItem.director)
    }
}

// MARK: 类型的扩展

/// 扩展可以添加属性
extension Double {
    var km: Double {
        return self / 1000.0
    }
}

/// 扩展可以添加方法
extension Int {
    func repeatTask(_ task: () -> Void) {
        for i in 0 ..< self {
            task()
        }
    }
}

/// 扩展可以添加下标
extension Int {
    /// 从右数，第几位数字为
    subscript(digitIndex: Int) -> Int {
        get {
            var base = 1
            for i in 0 ..< digitIndex {
                base *= 10
            }
            return (self / base) % 10
        }
    }
}

/// 扩展可以添加枚举属性
extension Int {
    enum Kind {
        case zero
        case negative
        case positive
    }
    
    var kind: Kind {
        get {
            switch self {
            case 0:
                return .zero
            case let x where x > 0:
                return .positive
            default:
                return .negative
            }
        }
    }
}

let speed = 1200.0
print(speed.km)

3.repeatTask {
    print("hello")
}

print(101010[3])

print(8.kind)
