# ⚡ TornSTL

[![CI](https://github.com/你的用户名/TornSTL/actions/workflows/ci.yml/badge.svg)](https://github.com/你的用户名/TornSTL/actions)
[![C++ Standard](https://img.shields.io/badge/C%2B%2B-17-blue.svg)](https://isocpp.org/)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

> **“手撕标准库，从底层理解C++”**

TornSTL 是一个基于教育目的、从零实现的 C++ 标准库子集。项目严格遵循 RAII、异常安全及迭代器失效准则，旨在深入剖析 STL 的底层内存管理与泛型设计。

## ✨ 核心特性
- **Header-Only**：纯头文件库，即插即用。
- **内存管理**：实现 `std::allocator` 的简版，支持自定义分配器。
- **容器实现**：`vector` (动态扩容)、`list` (双向链表)、`deque` (分段连续空间) —— *持续增加中*。
- **异常安全**：严格遵守强异常安全保证（commit-or-rollback）。

## 📦 已实现组件
| 组件 | 进度 | 备注 |
| :--- | :---: | :--- |
| `tornstl::vector` | ✅ 已完成 | 支持 2倍/1.5倍 动态扩容 |
| `tornstl::list` | 🚧 进行中 | 带头结点的双向循环链表 |
| `tornstl::reverse_iterator`| ✅ 已完成 | 反向迭代器适配器 |

## 🚀 快速开始
```cpp
#include <tornstl/vector.hpp>
#include <iostream>

int main() {
    tornstl::vector<int> vec = {1, 2, 3, 4};
    vec.push_back(5);
    for (auto& v : vec) {
        std::cout << v << " "; // 1 2 3 4 5
    }
    return 0;
}