#define WIN32_LEAN_AND_MEAN

#include <WinSock2.h>
#include <windows.h>
#include <psdk_inc/_ip_types.h>
#include <inaddr.h>
#include <cstdio>

//#pragma comment(lib, "ws2_32.lib")

int main() {

    // 启动Windows socket 2.x 环境
    WORD version = MAKEWORD(2, 2);
    WSADATA data ;
    WSAStartup(version,&data);

    ///
    // 1. 建立一个socket
    SOCKET _socket = socket(AF_INET, SOCK_STREAM, 0);
    if (INVALID_SOCKET == _socket) {
        printf("建立套接字失败!!!\n");
    } else {
        printf("建立套接字成功!!!\n");
    }

    // 2. 连接服务器 connect
    sockaddr_in _sin = {};
    _sin.sin_family = AF_INET;
    _sin.sin_port = htons(4567);
    _sin.sin_addr.S_un.S_addr = inet_addr("127.0.0.1");
    int ret = connect(_socket, (sockaddr*)&_sin, sizeof(sockaddr_in));
    if (SOCKET_ERROR == ret) {
        printf("连接服务器失败!!!\n");
    } else {
        printf("连接服务器成功!!!\n");
    }

    // 3. 接收服务器信息 recv
    char recvBuf[256] = {};
    int nLen = recv(_socket, recvBuf, 256, 0);
    if (nLen > 0) {
        printf("接收到数据: %s", recvBuf);
    }

    // 4. 关闭套接字
    closesocket(_socket);
    getchar();
    ///

    // 清除Windows socket 环境
    WSACleanup();

    return 0;
}