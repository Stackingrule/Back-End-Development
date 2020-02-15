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

    char _recvBuf[128] = {};
    while (true) {
        // 5. ���տͻ�������
        int nLen = recv(_clientSocket, _recvBuf, 128, 0);
        if (nLen <= 0) {
            printf("�ͻ������˳�, �������!!!");
            break;
        }
        printf("�յ�����: %s\n", _recvBuf);
        // 6. ��������
        if (0 == strcmp(_recvBuf, "getInfo")) {
            DataPackage dp = { 30, "Alan"};
            send(_clientSocket, (const char*)&dp, sizeof(DataPackage), 0);
        } else {
            char msgBuf[] = "This is Server!!!";
            send(_clientSocket, msgBuf, strlen(msgBuf) + 1, 0);
        }
        // 7.send ��ͻ��˷���һ������


    }

    // 8. �ر��׽���
    closesocket(_socket);
    ///

    WSACleanup();
    getchar();

    return 0;
}