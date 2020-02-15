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

    while (true) {

        // 3. 输入请求命令
        char cmdBuf[128] = {};
        scanf("%s", cmdBuf);
        // 4. 处理请求
        if (0 == strcmp(cmdBuf, "exit")) {
            printf("收到exit, 任务结束!!!");
            break;
        } else {
            // 5. 向服务端发送数据
            send(_socket, cmdBuf, strlen(cmdBuf) + 1, 0);
        }

        // 6. 接收服务器信息 recv

        char recvBuf[128] = {};
        int nLen = recv(_socket, recvBuf, 256, 0);
        if (nLen > 0) {
            DataPackage* dp = (DataPackage*) recvBuf;
            printf("接收到数据: 年龄=%d 姓名=%s\n", dp->age, dp->name);
        }
    }


    // 7. 关闭套接字
    closesocket(_socket);
    getchar();
    getchar();
    ///

    // 清除Windows socket 环境
    WSACleanup();
    printf("客户端已退出, 任务结束!!!");


    return 0;
}