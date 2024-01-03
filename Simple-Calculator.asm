org 100h
.data 
m1 db "enter first  numper:$"
m2 db 10,13,"enter second numper:$" 
m3 db 10,13,"chose the operator:",10,13,"$"
m4 db 10,13,"$"
m5 db 10,13,"yes press1 if no press0",10,13,"$"
m6 db 10,13,"worng input",10,13,"$"
.code
colc:
mov ah,09
lea dx,m1
int 21h

mov ah,01
int 21h

sub al,30h
mov bl,al
 
mov ah,09
lea dx,m2
int 21h

mov ah,01
int 21h

sub al,30h
mov cl,al    


mov ah,09
lea dx,m3
int 21h

mov ah,01
int 21h

cmp al,'+'
je toadd

cmp al,'-'
je tosub 

cmp al,'*'
je tomul  

cmp al,'/'
je todiv

tosub:

mov ah,09
lea dx,m4
int 21h

sub bl,cl
mov  dl,bl
add dl,30h

mov ah,02
int 21h
jmp repear         

toadd:

mov ah,09
lea dx,m4
int 21h

add bl,cl
mov  dl,bl
add dl,30h

mov ah,02
int 21h
jmp repear 

tomul:

mov ah,09
lea dx,m4
int 21h

add al,bl
mul cl
mov  dl,al
add dl,30h

mov ah,02
int 21h
jmp repear

todiv:

mov ah,09
lea dx,m4
int 21h
   
mov ah,00   
add al,bl
div cl
mov  dl,al
add dl,30h

mov ah,02
int 21h
jmp repear

repear: 
mov ah,09
lea dx,m5
int 21h  

mov ah,01
int 21h  

sub al,30h
               
cmp al,1
je colc

cmp al,0
je finish 



finish:
mov ah,00

