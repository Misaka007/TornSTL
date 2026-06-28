cmake_minimum_required(VERSION 3.15)
project(TornSTL VERSION 0.1.0 LANGUAGES CXX)

# 强制使用 C++17 或更高
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# 开启编译警告 (方便抓出潜在BUG)
if(MSVC)
    add_compile_options(/W4 /WX-)
else()
    add_compile_options(-Wall -Wextra -Wpedantic -Werror=return-type)
endif()

# 支持用户通过 -DTORNSTL_BUILD_TESTS=OFF 关闭测试
option(TORNSTL_BUILD_TESTS "Build unit tests" ON)
option(TORNSTL_BUILD_BENCHMARKS "Build benchmarks" OFF)

# 核心库（接口库，因为是Header-Only）
add_library(TornSTL INTERFACE)
target_include_directories(TornSTL INTERFACE 
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include>
)

# 如果开启了测试，添加测试子目录
if(TORNSTL_BUILD_TESTS)
    enable_testing()
    add_subdirectory(tests)
endif()

if(TORNSTL_BUILD_BENCHMARKS)
    add_subdirectory(benchmarks)
endif()