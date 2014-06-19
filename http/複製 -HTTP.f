\ fload 本文顯示.f

\ FTP demo  wesley 2006/10/24
	include wsock32.f
	
	create httptemp$ 4096 allot	
	create http$ 40960 allot

  create taddr 4 allot
  create talen 4 allot


	0 value http$>
	
	variable sock
	create  sinhim sockaddr_in allot

	: resolve_name { hname \ addr -- hostbynameAdr flag }
        hname c@ '0' '9' between
        if
        	hname rel>abs 
        	call inet_addr 
        	to addr
           	AF_INET 4 
             \ &local addr
             addr taddr !   taddr   \ 取代 &local addr             
              
             rel>abs   
           	call gethostbyaddr
        else 
        	hname  rel>abs 
        	call gethostbyname
        then 
        dup abs>rel swap
		;

\	create hp 256 allot	
	: tcp_open {  hostname  port \ hp sp resvport fd  -- n }
		sinhim sockaddr_in ERASE
		AF_INET sinhim >sin_family w!
		port 0 <= abort" tcp_open: must specify either service or port"
		port 
		call htons sinhim >sin_port w!
		hostname  resolve_name  
		0 = 
		if
			drop		  
        	WSATypeErr
            ." hostname not found"  cr
			-3 exit 
        else 
			>h_addr @ abs>rel @ abs>rel
			sinhim >sin_addr 
			sockaddr cmove
			port 0 >=
			if   
				0 SOCK_STREAM AF_INET 
				call socket 
				dup to fd 0 < abort" tcp_open: socket"
       		else 
       			port 0 <
            	if
               		IPPORT_RESERVED 1- to resvport
             	then
             	resvport 
             	call rresvport 
             	dup to fd abort" tcp_open: can't get a reserved TCP port"
        	then
       
    		sockaddr sinhim rel>abs fd 
    		call connect  
    		0<
        	if  cr ." tcp_open: connect:"
        		call WSAGetLastError u. abort    
        	then
        	fd
        then 
		;
		
	: Socket-Accept  { addr alen fh -- f }
   		\ &local alen 
            alen talen ! talen  \ 取代   &local alen 寫法 
       rel>abs addr rel>abs  fh call accept
		;

 	: TCP.read   { addr alen fh -- f }
		0 alen addr rel>abs fh 
		call recv 
		;


 	: TCP.write { addr alen fh -- f }
        MSG_DONTROUTE  alen addr rel>abs fh 
        call send 
        ;

	: close ( --- ) 
		call closesocket 
		;

	: listen ( --- )
		call listen 
		;


		
	: HTTP ( --- )
	
cls	
		z" jiemang.com" 80 tcp_open sock !
		
\		s" GET /y3jo6index.html HTTP/1.0" temp$ place	crlf$  count temp$ +place
\		s" Connection: Keep-Alive" temp$ +place	crlf$  count temp$ +place
\		s" User-Agent: Mozilla/4.01 [tw] (Win95; I)" temp$ +place	crlf$  count temp$ +place
\		s" Host: tpep8:81" temp$ +place	crlf$  count temp$ +place
\		s" Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, */*" temp$ +place	crlf$  count temp$ +place
\		s" Accept-Language: zh-TW" temp$ +place	crlf$  count temp$ +place
\		s" Accept-Charset: iso-8859-1,*,utf-8" temp$ +place	crlf$  count temp$ +place
\		crlf$  count temp$ +place
\		crlf$  count temp$ +place
\		crlf$  count temp$ +place
\		crlf$  count temp$ +place
\		crlf$  count temp$ +place
		
\		s" GET index.html HTTP/1.0" http$ lplace
\		s" GET index.html " http$ lplace	
		s" GET *.*" http$ lplace			
		crlf$  count http$ +lplace
		s" Connection: Keep-Alive" http$ +lplace	
		crlf$  count http$ +lplace
		s" User-Agent: Mozilla/4.01 [tw] (Win95; I)" http$ +lplace	
		crlf$  count http$ +lplace
		s" Host: tpep8:81" http$ +lplace	
		crlf$ count http$ +lplace
		s" Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, */*" http$ +lplace	
		crlf$  count http$ +lplace
		s" Accept-Language: zh-TW" http$ +lplace	
		crlf$  count http$ +lplace
		s" Accept-Charset: iso-8859-1,*,utf-8" http$ +lplace	
		crlf$  count http$ +lplace
		crlf$  count http$ +lplace
		crlf$  count http$ +lplace
		crlf$  count http$ +lplace
		crlf$  count http$ +lplace
		crlf$  count http$ +lplace		
		http$  lcount sock @ TCP.write 	drop
		http$ 200 dump
		cr ." 接收網頁伺服器傳回的資料封包:" cr cr
    
  \  key drop
    
    
		0 http$ ! 
		begin
			httptemp$ 255 sock @ TCP.read  dup cr .  dup 255 >=
		while
			drop httptemp$  http$ http$ @ + cell +  255 move
			http$ @ 255 + http$ !
		repeat
			>r
			httptemp$  http$ http$ @ + cell + r@ move
			http$ @ r> + http$ !
						
		
		4 to http$>
		begin
		 http$ http$> + c@ emit
		 http$> 1 + to http$>		 
		 http$ http$> + c@ 0 = 

		until
(
		4096 http$ !
		http$ lcount 0 scan
		drop http$ - 4 - http$ ! 
)				

(	
		http$  to 本文.基底
		cell  列max 1 + *	dup ALLOCATE drop  to 本文.列指標基底 	本文.列指標基底 !
		cell  列max 1 + *	dup ALLOCATE drop  to 本文.列長指標基底	本文.列長指標基底 !			 
		本文分行
		顯示編輯視窗
)
		;	
				
		http
