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

// DataPackage
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

    while (true) {

        DataHeader header = {};
        // 5. 接收客户端数据
        int nLen = recv(_clientSocket, (char *)&header, sizeof(header), 0);
        if (nLen <= 0) {
            printf("客户端已退出, 任务结束!!!");
            break;
        }
        printf("收到命令: %d 数据长度：%d \n", header.cmd, header.dataLength);
        switch (header.cmd) {
            case CMD_LOGIN:
            {
                Login login = {};
                recv(_clientSocket, (char *)&login, sizeof(Login), 0);
                // 忽略判断用户名密码
                LoginResult loginResult = {};

                send(_clientSocket, (char *)&header, sizeof(LoginResult),  0);
                send(_clientSocket, (char *)&loginResult, sizeof(LoginResult), 0);
            }
                break;
            case CMD_LOGOUT:
            {
                Logout logout = {};
                recv(_clientSocket, (char *)&logout, sizeof(Logout), 0);
                // 忽略判断用户名密码
                LogoutResult logoutResult = {};

                send(_clientSocket, (char *)&header, sizeof(LogoutResult),  0);
                send(_clientSocket, (char *)&logoutResult, sizeof(LogoutResult), 0);
            }
                break;

            default:
                header.cmd = CMD_ERROR;
                header.dataLength = 0;
                send(_clientSocket, (char *)&header, sizeof(header), 0);
            break;

        }

    }

    // 8. 关闭套接字
    closesocket(_socket);
    ///

    WSACleanup();
    getchar();

    return 0;
}