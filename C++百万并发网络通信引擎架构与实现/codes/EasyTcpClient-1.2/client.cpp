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
    WSADATA data ;
    WSAStartup(version,&data);

    ///
    // 1. ����һ��socket
    SOCKET _socket = socket(AF_INET, SOCK_STREAM, 0);
    if (INVALID_SOCKET == _socket) {
        printf("�����׽���ʧ��!!!\n");
    } else {
        printf("�����׽��ֳɹ�!!!\n");
    }

    // 2. ���ӷ����� connect
    sockaddr_in _sin = {};
    _sin.sin_family = AF_INET;
    _sin.sin_port = htons(4567);
    _sin.sin_addr.S_un.S_addr = inet_addr("127.0.0.1");
    int ret = connect(_socket, (sockaddr*)&_sin, sizeof(sockaddr_in));
    if (SOCKET_ERROR == ret) {
        printf("���ӷ�����ʧ��!!!\n");
    } else {
        printf("���ӷ������ɹ�!!!\n");
    }

    while (true) {

        // 3. ������������
        char cmdBuf[128] = {};
        scanf("%s", cmdBuf);
        // 4. ��������
        if (0 == strcmp(cmdBuf, "exit")) {
            printf("�յ�exit, �������!!!");
            break;
        } else {
            // 5. �����˷�������
            send(_socket, cmdBuf, strlen(cmdBuf) + 1, 0);
        }

        // 6. ���շ�������Ϣ recv

        char recvBuf[128] = {};
        int nLen = recv(_socket, recvBuf, 256, 0);
        if (nLen > 0) {
            DataPackage* dp = (DataPackage*) recvBuf;
            printf("���յ�����: ����=%d ����=%s\n", dp->age, dp->name);
        }
    }


    // 7. �ر��׽���
    closesocket(_socket);
    getchar();
    getchar();
    ///

    // ���Windows socket ����
    WSACleanup();
    printf("�ͻ������˳�, �������!!!");


    return 0;
}