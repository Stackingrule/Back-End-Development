cmake_minimum_required(VERSION 3.15)
project(EasyTcpClient)

set(CMAKE_CXX_STANDARD 11)
link_libraries(ws2_32)
add_executable(EasyTcpClient client.cpp)