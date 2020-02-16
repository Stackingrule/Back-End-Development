#define WIN32_LEAN_AND_MEAN

#include <WinSock2.h>
#include <windows.h>
#include <psdk_inc/_ip_types.h>
#include <cstdio>

//#pragma comment(lib, "ws2_32.lib")

enum CMD {
    CMD_LOGIN,
    CMD_LOGOUT,
    CMD_ERROR
};
struct DataHeader {
    short dataLength;
    short cmd;
};

struct Login {
    char userName[32];
    char userPass[32];
};
struct LoginResult {
    int result;

};

struct Logout {
    char userName[32];
};
struct LogoutResult {
    int result;

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
            printf("收到exit, 任务结束!!!\n");
            break;
        } else if (0 == strcmp(cmdBuf, "login")){
            Login login = {"Tim", "123"};
            DataHeader dataHeader = {CMD_LOGIN, sizeof(login)};
            // 5. 向服务端发送数据
            send(_socket, (char *)&dataHeader, sizeof(dataHeader), 0);
            send(_socket, (char *)&login, sizeof(login), 0);
            // 接收服务器返回的数据
            DataHeader retHeader = {sizeof(login), CMD_LOGIN};
            LoginResult  loginResult = {};
            recv(_socket, (char *)&retHeader, sizeof(retHeader), 0);
            recv(_socket, (char *)&loginResult, sizeof(loginResult), 0);
            printf("LoginResult: %d \n", loginResult.result);
        } else if (0 == strcmp(cmdBuf, "logout")) {
            Logout logout = {"Tim"};
            DataHeader dataHeader = {sizeof(logout), CMD_LOGOUT};
            // 5. 向服务端发送数据
            send(_socket, (char *)&dataHeader, sizeof(dataHeader), 0);
            send(_socket, (char *)&logout, sizeof(logout), 0);
            // 接收服务器返回的数据
            DataHeader retHeader = {};
            LogoutResult  logoutResult = {};
            recv(_socket, (char *)&retHeader, sizeof(retHeader), 0);
            recv(_socket, (char *)&logoutResult, sizeof(logoutResult), 0);
            printf("LogoutResult: %d \n", logoutResult.result);
        } else {
            printf("收到不支持命令, 重新输入!!!\n");
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