 	28 constant sockaddr_in
 	16 constant sockaddr
	: >sin_family ;
	: >sin_port 1+ 1+ ;
	: >sin_addr 4 + ;

	: >s_port   1+ 1+ ;

	: >h_addr   12 + ;
	: >h_length 4 +   ;

   	2    constant AF_INET
   	1    constant SOCK_STREAM
	1024    constant IPPORT_RESERVED

	0x1 constant MSG_OOB
	0x2 constant MSG_PEEK
	0x4 constant MSG_DONTROUTE

	10000 constant WSABASEERR

	WSABASEERR   93 + constant WSANOTINITIALISED

	WSABASEERR   50 + constant WSAENETDOWN

	WSABASEERR 1003 + constant WSANO_RECOVERY

	WSABASEERR 1004 + constant WSANO_DATA

	WSABASEERR   36 + constant WSAEINPROGRESS

	WSABASEERR    4 + constant WSAEINTR

	: WSATypeErr
\ \
               call  GetLastError
                  case
		WSANOTINITIALISED of ." A successful WSAStartup() must occur" cr
                     ." before using this API." cr endof

		WSAENETDOWN       of ." The Windows Sockets implementation has" cr
                     ." detected that the network subsystem" cr
                     ." has failed." cr endof

\ WSAHOST_NOT_FOUND of ." Authoritative Answer Host not found." cr endof

\ WSATRY_AGAIN      of ." Non-Authoritative Host not found," cr
\                      ." or SERVERFAIL." cr endof

		WSANO_RECOVERY    of ." Non recoverable errors," cr
                     ." FORMERR, REFUSED, NOTIMP." cr endof

		WSANO_DATA        of ." Valid name, no data record" cr
                     ." of requested type." cr         endof

		WSAEINPROGRESS    of ." A blocking Windows Sockets operation" cr
                     ." is in progress." cr endof

		WSAEINTR	of ." The (blocking) call was canceled" cr
                     ." via WSACancelBlockingCall()" cr endof
                     dup u. ." ???????"
        endcase

	;

\ 256 constant WSADESCRIPTION_LEN
\ 218 constant WSASYS_STATUS_LEN
	
	variable  WSAData
		2         \  WORD wVersion;
		2       + \  WORD wHighVersion;
		256  1+ + \ szDescription[WSADESCRIPTION_LEN+1];
		218  1+ + \ szSystemStatus[WSASYSSTATUS_LEN+1];
		2       + \ unsigned short iMaxSockets;
		2       + \ unsigned short iMaxUdpDg;
		4       + \ char FAR * lpVendorInfo
        allot


winlibrary wsock32.dll
\ winlibrary ws2_32.dll
 WSAData rel>abs 0x0101 call WSAStartup drop
cls

