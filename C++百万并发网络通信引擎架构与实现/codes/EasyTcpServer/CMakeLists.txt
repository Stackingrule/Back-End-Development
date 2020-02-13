cmake_minimum_required(VERSION 3.15)
project(EasyTcpServer)

set(CMAKE_CXX_STANDARD 11)
link_libraries(ws2_32)
add_executable(EasyTcpServer server.cpp)