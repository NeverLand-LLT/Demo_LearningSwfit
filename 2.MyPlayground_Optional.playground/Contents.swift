import UIKit

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
