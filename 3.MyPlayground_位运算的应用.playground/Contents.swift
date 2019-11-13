import UIKit

var str = "Hello, playground"

// 1. 不借助临时变量，交换两个变量的值

var a = 10
var b = 8
a = a ^ b
b = a ^ b
a = a ^ b

print(a)
print(b)

// 2. 求无符号整数二进制中1的个数
/*
 给定一个无符号整形UInt 变量，求其二进制表示中"1"的个数

 如果整数的二进制中有较多的0，那么我们每一次右移以为做判断会浪费

 */

// func getCountOfOne(num1: UInt) -> UInt {
//    var count: UInt = 0
// var temp = num1
//    while temp != 0 {
//        count += (temp & 1)
//        temp = (temp >> 1)
//    }
//    return count
// }

func getCountOfOne(num1: UInt) -> UInt {
    var count: UInt = 0
    var temp = num1
    while temp != 0 {
        count += 1
        temp = (temp & (temp - 1))
    }
    return count
}

print(getCountOfOne(num1: 8))

// 3. 如何判断一个整数为2的证书次幂
/*
 给定一个无符号整型变量，判断是否为2的整数次幂
 */

/// 与-1 数想与，只有不为0才算是有效
func isPowerOfTwo(num: UInt) -> Bool {
    return num & (num - 1) == 0

}


// MARK -

// 4. 寻找一串数字中小时的那个数(TODO 0 0 位运算符应用举例2)
