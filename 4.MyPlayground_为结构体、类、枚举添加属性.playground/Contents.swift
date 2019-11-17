import UIKit

// var str = "Hello, playground"

/// 结构体

struct Point {
    var x = 0
    var y = 0

    mutating func moveBy(x: Int, y: Int) {
//        self.x += x
//        self.y += y
        self = Point(x: self.x + x, y: self.y + y)
    }

    func printInfo() {
        print("x is \(x), y is \(y) ")
    }

    static func printTypeInfo() {
        print("A point")
    }
}

var p = Point(x: 2, y: 3)
p.printInfo()
p.moveBy(x: 2, y: 7)
p.printInfo()

/// 枚举

// MARK: - 为结构体、类、枚举定义下标

// 类型定义

struct Matrix {
    let rows: Int
    let columns: Int
    var grid: [Double] // 数组

    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }

    subscript(row: Int, column: Int) -> Double {
        get {
            return grid[row * columns + column]
        }
        set {
            grid[row * columns + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[1, 0] = 9.9
matrix[0, 1] = 8.8

print(matrix.grid)
print(matrix[0, 1])

// 枚举 为枚举定义下标
enum CompassPoint: Int {
    case south = 1
    case north
    case easy
    case west
    
    static subscript(index: Int) -> CompassPoint {
        get {
            return CompassPoint(rawValue: index)!
        }
    }
}

let direction = CompassPoint[2]
print(direction)
