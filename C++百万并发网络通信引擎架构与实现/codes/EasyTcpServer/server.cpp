#define WIN32_LEAN_AND_MEAN

#include <WinSock2.h>
#include <windows.h>
#include <psdk_inc/_ip_types.h>
#include <inaddr.h>
#include <cstdio>

//#pragma comment(lib, "ws2_32.lib")

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

    char msgBuf[] = "Hello Socket!!!";

    while (true) {
        if (INVALID_SOCKET == _clientSocket) {
            printf("���󣬽��յ���Ч�Ŀͷ���socket!!!\n");
        }

        printf("�¿ͷ��˼��� : IP = %s \n", inet_ntoa(clientAddr.sin_addr));
        // 5.send ��ͻ��˷���һ������
        send(_clientSocket, msgBuf, strlen(msgBuf) + 1, 0);

    }

    // 6. �ر��׽���
    closesocket(_socket);
    ///

    WSACleanup();

    return 0;
}