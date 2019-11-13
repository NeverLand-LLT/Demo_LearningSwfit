import UIKit

var str = "Hello, playground"


// MARK: - 赋值运算符

/*
 1. swift的赋值运算符不会返回值
    if b = a error
 2. swift的复制运算符默认不允许值溢出
 
 */

var a = 1
var b = 0

if b == a {
    print("===>print right")
}

// 当余数为负数时它的正负号被忽略掉。a%b a%-b得到相同的值

let c = 9 % 4
print(c)

let d = 9 % -4
print(d)

// ======================

// MARK: - 溢出运算符

/// swift 提供三个算术溢出运算符

let num1: UInt8 = 250
let num2: UInt8 = num1 &+ 10
print(num2)

let num3: UInt8 = 0
let num4: UInt8 = num3 &- 1
print(num4)

let num5: Int8 = -128
let num6: Int8 = num5 &- 1
print(num6)

// MARK: - 合并空值运算符

let a1: Int? = nil
let b1 = 4
print(a1 ?? b1)

/// 可以得到String类型，并且a 与 b 不是同类型
let a2: Int? = nil
let b2: String = "b2"
print(a2 ?? b2)


// MARK: - 区间运算符

let range = 0..<10
for i in range {
    print(i)
}

let names = ["Amy", "Tom", "Jone", "jason"]
for name in names[2...] {
    print(name)
}

print("=====区间运算符Finish")

// MARK: - 位运算

// 取反
let number1: UInt8 = 255
let number2 = ~number1

let number3 = number1 & number2
let number4 = number1 | number2

// 异或，不同为1 相同为0
let number5 = number1 ^ number2

// 左移右移 *2 /2
let number6: Int8 = -8
print(number6 << 1)
print(number6 >> 1)

print("=====左移右移Finish")


// MARK: - 运算符的重载

struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D {
    /// 二元运算符
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x , y: left.y + right.y)
    }
    
    ///  一元 前缀运算符
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
    
    /// 复合运算符
    static func += (left: inout Vector2D, right: Vector2D) {
        left = Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
    
}

/// 重载等价运算符
extension Vector2D: Equatable {
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
}


let vector = Vector2D(x: 1.0, y: 2.0)
let anotherVector = Vector2D(x: 3.0, y: 1.0)
let result = vector + anotherVector
print("====>Vector2D: result(x:\(result.x),y:\(result.y)")

let revVector = -vector
print("====>负vector:\(revVector)")

var vector3 = Vector2D(x: 1.0, y: 1.0)
let vector4 = Vector2D(x: 2.0, y: 3.0)
vector3 += vector4
print("====> 复合运算符: vector3:\(vector3)")

print("====> vector3 == vector4 是否相等:\(vector3 == vector4)")

/// 自定义运算符

/// 声明前缀运算符
prefix operator +++

extension Vector2D {
    static prefix func +++ (vector: Vector2D) -> Vector2D {
        return Vector2D(x: vector.x + vector.x , y: vector.y + vector.y)
    }
}

let vectorTobeDoubled = Vector2D(x: 1.0, y: 3.0)
let doubleVector = +++vectorTobeDoubled
print("source:\(vectorTobeDoubled) +++ ==> doubleVector:(x:\(doubleVector.x),y:\(doubleVector.y))")


/// 声明中缀运算符
infix operator +-: AdditionPrecedence /// 优先级为 + 法级别

extension Vector2D {
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
}

var firstVector = Vector2D(x: 1.0, y: 1.0)
let secondVector = Vector2D(x: 2.0, y: 3.0)
let result1 = firstVector +- secondVector
print("\(result1.x) \(result1.y)")

infix operator *^: MultiplicationPrecedence /// 优先级为 * 法级别

extension Vector2D {
    static func *^ (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x * right.x, y: left.y * left.y  + right.y + right.y)
    }
}

let result2 = firstVector *^ secondVector
print("\(result2.x)  \(result2.y)")
