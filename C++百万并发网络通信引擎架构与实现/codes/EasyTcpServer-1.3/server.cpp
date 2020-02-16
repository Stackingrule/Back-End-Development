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

    // ����Windows socket 2.x ����
    WORD version = MAKEWORD(2, 2);
    WSADATA data;
    WSAStartup(version,&data);

    ///
    // 1. ����socket
    SOCKET _socket= socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    if (INVALID_SOCKET == _socket) {
        printf("�����׽���ʧ��!!!\n");
    } else {
        printf("�����׽��ֳɹ�!!!\n");
    }

    // 2. �󶨶˿�
    sockaddr_in _sin = {};
    _sin.sin_family = AF_INET;
    _sin.sin_port = htons(4567);
    _sin.sin_addr.S_un.S_addr = inet_addr("127.0.0.1"); // INADDDR_ANY;
    if (SOCKET_ERROR == bind(_socket, (sockaddr*)&_sin, sizeof(_sin))) {
        printf("ERROR, �����ڽ��տͻ������ӵ�����˿�ʧ��!!!\n");
    } else {
        printf("�󶨶˿ڳɹ�!!!\n");
    }

    // 3.��������˿�
    if (SOCKET_ERROR == listen(_socket, 5)) {
        printf("��������˿�ʧ��!!!\n");
    } else {
        printf("��������˿ڳɹ�!!!\n");
    }

    // 4. accept �ȴ����տͻ��˵�����
    sockaddr_in clientAddr = {};
    int nAddrLen = sizeof(sockaddr_in);
    SOCKET _clientSocket = INVALID_SOCKET;
    _clientSocket = accept(_socket, (sockaddr*)&clientAddr, &nAddrLen);


    if (INVALID_SOCKET == _clientSocket) {
        printf("���󣬽��յ���Ч�Ŀͷ���socket!!!\n");
    }

    printf("�¿ͷ��˼��� :socket = %d \nIP = %s \n", (int) _clientSocket, inet_ntoa(clientAddr.sin_addr));

    while (true) {

        DataHeader header = {};
        // 5. ���տͻ�������
        int nLen = recv(_clientSocket, (char *)&header, sizeof(header), 0);
        if (nLen <= 0) {
            printf("�ͻ������˳�, �������!!!");
            break;
        }
        printf("�յ�����: %d ���ݳ��ȣ�%d \n", header.cmd, header.dataLength);
        switch (header.cmd) {
            case CMD_LOGIN:
            {
                Login login = {};
                recv(_clientSocket, (char *)&login, sizeof(Login), 0);
                // �����ж��û�������
                LoginResult loginResult = {};

                send(_clientSocket, (char *)&header, sizeof(LoginResult),  0);
                send(_clientSocket, (char *)&loginResult, sizeof(LoginResult), 0);
            }
                break;
            case CMD_LOGOUT:
            {
                Logout logout = {};
                recv(_clientSocket, (char *)&logout, sizeof(Logout), 0);
                // �����ж��û�������
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

    // 8. �ر��׽���
    closesocket(_socket);
    ///

    WSACleanup();
    getchar();

    return 0;
}