#define WIN32_LEAN_AND_MEAN

#include <WinSock2.h>
#include <windows.h>
#include <psdk_inc/_ip_types.h>
#include <cstdio>

//#pragma comment(lib, "ws2_32.lib")

struct DataPackage {
    int age;
    char name[32];
};

int main() {

    // 启动Windows socket 2.x 环境
    WORD version = MAKEWORD(2, 2);
    WSADATA data;
    WSAStartup(version,&data);

    ///
    // 1. 建立socket
    SOCKET _socket= socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    if (INVALID_SOCKET == _socket) {
        printf("建立套接字失败!!!\n");
    } else {
        printf("建立套接字成功!!!\n");
    }

    // 2. 绑定端口
    sockaddr_in _sin = {};
    _sin.sin_family = AF_INET;
    _sin.sin_port = htons(4567);
    _sin.sin_addr.S_un.S_addr = inet_addr("127.0.0.1"); // INADDDR_ANY;
    if (SOCKET_ERROR == bind(_socket, (sockaddr*)&_sin, sizeof(_sin))) {
        printf("ERROR, 绑定用于接收客户端连接的网络端口失败!!!\n");
    } else {
        printf("绑定端口成功!!!\n");
    }

    // 3.监听网络端口
    if (SOCKET_ERROR == listen(_socket, 5)) {
        printf("监听网络端口失败!!!\n");
    } else {
        printf("监听网络端口成功!!!\n");
    }

    // 4. accept 等待接收客户端的连接
    sockaddr_in clientAddr = {};
    int nAddrLen = sizeof(sockaddr_in);
    SOCKET _clientSocket = INVALID_SOCKET;
    _clientSocket = accept(_socket, (sockaddr*)&clientAddr, &nAddrLen);


    if (INVALID_SOCKET == _clientSocket) {
        printf("错误，接收到无效的客服端socket!!!\n");
    }

    printf("新客服端加入 :socket = %d \nIP = %s \n", (int) _clientSocket, inet_ntoa(clientAddr.sin_addr));

    char _recvBuf[128] = {};
    while (true) {
        // 5. 接收客户端数据
        int nLen = recv(_clientSocket, _recvBuf, 128, 0);
        if (nLen <= 0) {
            printf("客户端已退出, 任务结束!!!");
            break;
        }
        printf("收到命令: %s\n", _recvBuf);
        // 6. 处理请求
        if (0 == strcmp(_recvBuf, "getInfo")) {
            DataPackage dp = { 30, "Alan"};
            send(_clientSocket, (const char*)&dp, sizeof(DataPackage), 0);
        } else {
            char msgBuf[] = "This is Server!!!";
            send(_clientSocket, msgBuf, strlen(msgBuf) + 1, 0);
        }
        // 7.send 向客户端发送一条数据


    }

    // 8. 关闭套接字
    closesocket(_socket);
    ///

    WSACleanup();
    getchar();

    return 0;
}