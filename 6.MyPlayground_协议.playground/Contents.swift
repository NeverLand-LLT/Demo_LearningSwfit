import UIKit

var str = "Hello, playground"

protocol Named {
    // 可读
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Person: Named, Aged {
    /// 支持可读可写，满足可读的要求
    var name: String
    var age: Int
}

let p = Person(name: "xiajiao", age: 20)

func wish(to: Named & Aged) {
    print("wish: name \(to.name) age \(to.age)")
}

wish(to: p)


// MARK: - 协议的扩展

protocol TextRepresentable {
    var desc: String {get}
}

extension Person: TextRepresentable {
    var desc: String {
        return "name \(name) age \(age)"
    }
}

print(p.desc)

//extension Array: TextRepresentable where Element: TextRepresentable {
//    var desc: String {
//        let itemDesc = self.map{$0.desc}
//        return itemDesc.joined(separator: ",")
//    }
//}

extension Collection where Iterator.Element : TextRepresentable {
    var desc: String {
        let itemDesc = self.map{$0.desc}
        return itemDesc.joined(separator: ",")
    }
}

let array = [Person(name: "zhangsan", age: 20), Person(name: "LiSi", age: 30)]
print(array.desc)

// Int 类没有desc
let intArray = [1,2,3]
//print(intArray.description)
