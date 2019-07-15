.model small
.stack 100h
.486
.data
hello db "=========KALKULATOR=========$"
dod db "1.Dodawanie$"
od db "2.Odejmowanie$"
mn db "3.Mnozenie$"
dz db "4.Dzielenie$"
zakoncz db "ESC - zakoncz$"
dbz db "Kto dzieli przez 0 ten wyniku nie otrzyma.$"
ask db "Wybierz dzialanie do wykonania: $"
x db "Podaj x: $"
y db "Podaj y: $"
xnum db ?
ynum db ?
wyn db "Wynik: $"
whatnext db "Nacisnij ENTER jezeli chcesz kontunuowac lub ESC aby zakonczyc.$"
.code
main proc
start:
     call cls

     mov ax,@data
     mov ds,ax
     mov dx, offset hello
     mov ah,09h
     int 21h

     call nowa

     mov dx,offset dod
     mov ah,09h
     int 21h

     call nowa

     mov dx,offset od
     mov ah,09h
     int 21h

     call nowa

     mov dx, offset mn
     mov ah,09h
     int 21h

     call nowa

     mov dx, offset dz
     mov ah,09h
     int 21h

     call nowa

     mov dx, offset zakoncz
     mov ah,09h
     int 21h

     call nowa

     mov dx, offset ask
     mov ah,09h
     int 21h

     mov ah,01h
     int 21h
     cmp al, '1'
     je dodaj
     cmp al,'2'
     je odejmij
     cmp al,'3'
     je mnoz
     cmp al,'4'
     je dziel
     cmp al, 1bh ;esc
     je koniec

dodaj:
        call nowa

        mov dx, offset x
        mov ah,09h
        int 21h
        call wczytajx

        call nowa

        mov dx,offset y
        mov ah,09h
        int 21h

        call wczytajy

        mov al, xnum
        mov bl, ynum
        add al,bl

        push ax

        call nowa

        pop ax
        aaa

        mov dx, offset wyn
        mov ah,09h
        int 21h
        or ax,3030h
        mov ah,0eh
        int 10h

        jmp codalej

odejmij:
         call nowa

         mov dx,offset x
         mov ah,09h
         int 21h

         call wczytajx

         call nowa

         mov dx,offset y
         mov ah,09h
         int 21h

         call wczytajy

         mov al,xnum
         mov bl,ynum
         sub al,bl
         aaa
         push ax

         call nowa

         pop ax

         mov dx,offset wyn
         mov ah,09h
         int 21h
         or ax,3030h
         mov ah,0eh
         int 10h

         jmp codalej

mnoz:
      call nowa

      mov dx,offset x
      mov ah,09h
      int 21h

      call wczytajx

      call nowa

      mov dx,offset y
      mov ah,09h
      int 21h

      call wczytajy

      mov al,xnum
      mov bl,ynum
      mul bl

      push ax

      call nowa

      pop ax
      aaa

      mov dx,offset wyn
      mov ah,09h
      int 21h
      or ax,3030h
      mov ah,0eh
      int 10h

      jmp codalej

dziel:
       call nowa

       mov dx, offset x
       mov ah,09h
       int 21h

       call wczytajx

       call nowa

       mov dx,offset y
       mov ah,09h
       int 21h
       call wczytajy

       cmp al,'0'
       je dbzerr

       mov al, xnum
       mov bl, ynum
       div bl

       push ax

       call nowa

       pop ax
       aaa

       mov dx,offset wyn
       mov ah,09h
       int 21h
       or ax,3030h
       mov ah,0eh
       int 10h

       jmp codalej

dbzerr:
     call nowa

     mov dx,offset dbz
     mov ah,09h
     int 21h
     jmp codalej

codalej:
     call nowa

     mov dx,offset whatnext
     mov ah,09h
     int 21h

     call nowa

     mov ah,01h
     int 21h
     cmp al,0dh
     je start
     cmp al,1bh
     je koniec

nowa:
      mov ah,02h
      mov dl,13
      int 21h
      mov dl,10
      int 21h
ret

wczytajx:
      mov ah,01h
      int 21h
      mov xnum,al
ret

wczytajy:
      mov ah,01h
      int 21h
      mov ynum,al
ret

cls:
     mov ax,3
     int 10h
ret

koniec:
     mov ah,4ch
     int 21h
main endp
end main
