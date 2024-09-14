cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

project(DDCKV LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 17)
#set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
#find_package(Boost REQUIRED)
#add_definitions(-Dcacheline_length=64)
link_directories(/sharenvme/usershome/wyf/nudm/spack/opt/spack/linux-ubuntu22.04-icelake/gcc-11.4.0/boost-1.66.0-gqukxh5x7vhrn2zwyod5evelvtxg7fur/lib)
include_directories( /sharenvme/usershome/wyf/nudm/spack/opt/spack/linux-ubuntu22.04-icelake/gcc-11.4.0/boost-1.66.0-gqukxh5x7vhrn2zwyod5evelvtxg7fur/include)
include_directories(src)
set(CMAKE_BUILD_TYPE Release)

add_subdirectory(src)

add_subdirectory(ycsb-test)
add_subdirectory(crash-recover-test)
add_subdirectory(micro-test)

enable_testing()
add_subdirectory(tests)
