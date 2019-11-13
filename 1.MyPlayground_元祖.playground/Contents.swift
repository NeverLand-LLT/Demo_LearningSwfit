import UIKit


// MARK: - Tuple

/// 元祖

//let error = (1, "没有权限")
//print(error)
//
//print(error.0)
//print(error.1)


//let error = (errorCode: 1, errorMessage: "没有权限")
//print(error.errorCode)
//print(error.errorMessage)

// MARK:  创建

///// 1. 元祖在创建之后，无论是var 还是let 都不可以改变类型。但是Any可以赋值任何值
//var error: (errorCode: Int, errorMessage: Any) = (errorCode: 1, errorMessage: "没有权限")
//error.errorCode = 2
//error.errorMessage = 404

// MARK:  分解
let error = (1, "没有权限")
let (errorCode, errorMessage) = error
print(errorCode)
print(errorMessage)


// MARK: - Optional

// Optional 简单实现
var str: Optional<String> = "abcd"
if let actualStr = str {
    let count = actualStr.count
    print(count)
}

// Optional 展开实现
// unsafelyUnwrapped 强制解包装，与 ！ 性质一样，是一种不安全的做法
let count = str.unsafelyUnwrapped.count
print(count)


// MARK: - 字符串

//(TODO - 暂时还不需要深究)
