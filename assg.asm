.model small
.stack
.data

;======================================================login======================================================

user db "user12345"
pass db "abcd"
pass2 db "owner"
msg1 db 0dh,0ah,"***************************************************************************"
     db 0dh,0ah,"                      Welcome to AAA Stationary Shop!!! "
     db 0dh,0ah,"***************************************************************************"
	 db 0dh,0ah," "
     db 0dh,0ah,"Please Login First To Continue... $"
msg2 db 0dh,0ah," Enter Username: $"
msg3 db 0dh,0ah," Enter Password: $"
msg4 db 0dh,0ah,"----------------------------------------------------------------------------"
	 db 0dh,0ah,"	                 Invalid Login. Please Try Again...  "
     db 0dh,0ah,"----------------------------------------------------------------------------$"
msg5 db 0dh,0ah,"----------------------------------------------------------------------------"
	 db 0dh,0ah,"	                       Login Successfully  "
     db 0dh,0ah,"----------------------------------------------------------------------------$"
     db 0dh,0ah," $"
msg6 db 0dh,0ah,"***************************************************************************"
     db 0dh,0ah,"           Welcome The Owner of AAA Stationary Shop!!! "
     db 0dh,0ah,"***************************************************************************"
	 db 0dh,0ah," $"
ownerMSG db 0dh,0ah,"Are You Owner??? If yes, type '1' to continue. If not, type any key.$"
ownerMSG2 db 0dh,0ah," "
          db 0dh,0ah,"Please enter password to login into owner page.....$"
userroleMSG db 0dh,0ah," "
            db 0dh,0ah,">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
			db 0dh,0ah,">>>      You are user only. Your account only can do transaction...      <<<"
			db 0dh,0ah,">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<$"
ownerroleMSG db 0dh,0ah,">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
             db 0dh,0ah,">>>   You are owner. Your account can do transaction and view report...  <<<"
			 db 0dh,0ah,">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<$"

alertLoginEnd db 0dh,0ah, "The number of attempt is over."
              db 0dh,0ah, "Please try again later..."
			  db 0dh,0ah, "Thank you.$"

user2MSG  db 0dh,0ah," "
	 	  db 0dh,0ah,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
		  db 0dh,0ah," "
		  db 0dh,0ah,"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
		  db 0dh,0ah,"^^           Menu             ^^"
		  db 0dh,0ah,"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
		  db 0dh,0ah,"^^     1. Do Transaction      ^^"
		  db 0dh,0ah,"^^     2. Log Out             ^^"
		  db 0dh,0ah,"^^     3. Owner Login         ^^"
		  db 0dh,0ah,"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
		  db 0dh,0ah,"Please type in the number of the menu that you want to go : $"

owner2MSG db 0dh,0ah," "
	 	  db 0dh,0ah,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
		  db 0dh,0ah," "
		  db 0dh,0ah,"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
		  db 0dh,0ah,"^^           Menu             ^^"
		  db 0dh,0ah,"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
		  db 0dh,0ah,"^^     1. Do Transaction      ^^"
		  db 0dh,0ah,"^^     2. View Report         ^^"
		  db 0dh,0ah,"^^     3. Log Out             ^^"
		  db 0dh,0ah,"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
		  db 0dh,0ah,"Please type in the number of the menu that you want to go : $"

owner3MSG db 0dh,0ah," "
	 	  db 0dh,0ah,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
		  db 0dh,0ah," "
		  db 0dh,0ah,"Invalid Input. Please choose again.$"

newLine db 0dh,0ah,"$"

logoutMSG db 0dh,0ah,"Are you sure you want to log out??? Please type '1' if you want to logout. $"
logoutMSG2 db 0dh,0ah,"Thank you for visiting. Please come again.$"
logoutvalidation db 0
logoutvalidation2 db 0

para_list label byte
maxLen	DB	10
ActLen	DB	?
userInput db 10 dup (' ')

pass_list label byte
max db 10
act db ?
passInput db 10 dup (' ')

pass_list2 label byte
max2 db 10
act2 db ?
passInput2 db 10 dup (' ')

owner db 0
ownermenu db 0
usermenu db 0

;===================================================display menu==================================================
itemMSG db 0dh,0ah," "
        db 0dh,0ah,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        db 0dh,0ah," "
        db 0dh,0ah,"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
        db 0dh,0ah,"^^          ITEMS             ^^"
        db 0dh,0ah,"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
        db 0dh,0ah,"^^      1.Pen                 ^^"
        db 0dh,0ah,"^^      2.Pencil              ^^"
        db 0dh,0ah,"^^      3.Highlighter Pen     ^^"
        db 0dh,0ah,"^^      4.Marker              ^^"
        db 0dh,0ah,"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
        db 0dh,0ah,"Please type in the number of the item that you want to buy : $"

brandMSG db 0dh,0ah," "
         db 0dh,0ah,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
         db 0dh,0ah," "
         db 0dh,0ah,"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
         db 0dh,0ah,"^^          BRANDS            ^^"
         db 0dh,0ah,"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
         db 0dh,0ah,"^^     1. Star                ^^"
         db 0dh,0ah,"^^     2. Swams               ^^"
         db 0dh,0ah,"^^     3. Faber-Castell       ^^"
         db 0dh,0ah,"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
         db 0dh,0ah,"Please type in the number of the brand that you want to buy : $"

spaceMSG db 0dh,0ah," "
         db 0dh,0ah,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~$"

item db ?
brand db ?
thing db ?
ten db 10
hun db 100
q1 db 0
r1 db 0
q2 db 0
r2 db 0
q11 db 0
r11 db 0
q21 db 0
r21 db 0
q12 db 0
r12 db 0
q22 db 0
r22 db 0
q13 db 0
r13 db 0
q23 db 0
r23 db 0
scharge db 0
unit1 db 0
unit2 db 0
unit db 0
totalBeforeCharge db 0
displaytotalBeforeCharge db 0
totalAfterCharge db 0
displayscharge db 0
displaytotalAfterCharge db 0
charge db 108
pay1 db 0
pay2 db 0
pay3 db 0
pay db 0
totalback db 0
totalgive db 0

;owner additem
item2 db 0
brand2 db 0
thing2 db 0 
unit12 db 0
unit22 db 0
unit20 db 0
totalBeforeCharge2 db 0
q120 db 0
r120 db 0
displaytotalBeforeCharge2 db 0
totalAfterCharge2 db 0
q112 db 0
r112 db 0
q212 db 0
r212 db 0
scharge2 db 0
q132 db 0
r132 db 0
q232 db 0
r232 db 0
displayscharge2 db 0
displaytotalAfterCharge2 db 0
pay12 db 0
pay22 db 0 
pay32 db 0
pay20 db 0
totalback2 db 0
q122 db 0
r122 db 0
q222 db 0
r222 db 0
totalgive2 db 0

;======================================define price per unit for each item========================================
penstar db 10
penswams db 12
penfaber db 12

pencilstar db 12
pencilswams db 14
pencilfaber db 15

highlighterstar db 24
highlighterswams db 22
highlighterfaber db 14

markerstar db 15
markerswams db 21
markerfaber db 34

;======================================display msg of price per unit===============================================

penstarMSG db 0ah,0dh,"Star's Pen Price Per Unit is RM 10$"
penswamsMSG db 0ah,0dh,"Swams's Pen Price Per Unit is RM 12$"
penfaberMSG db 0ah,0dh,"Faber-Castell's Pen Price Per Unit is  RM 12$"

pstarMSG db 0ah,0dh,"Star's Pencil Price Per Unit is RM 12$"
pencilswamsMSG db 0ah,0dh,"Swams's Pencil Price Per Unit is RM 14$"
pencilfaberMSG db 0ah,0dh,"Faber-Castell's Pencil Price Per Unit is RM 15$"

highlighterstarMSG db 0ah,0dh,"Star's Highlighter Price Per Unit is RM 24$"
highlighterswamsMSG db 0ah,0dh,"Swams's Highlighter Price Per Unit is RM 22$"
highlighterfaberMSG db 0ah,0dh,"Faber-Castell's Highlighter Price Per Unit is RM 14$"

markerstarMSG db 0ah,0dh,"Star's Marker Price Per Unit is RM 15$"
markerswamsMSG db 0ah,0dh,"Swams's Marker Price Per Unit is RM 21$"
markerfaberMSG db 0ah,0dh,"Faber-Castell's Marker Price Per Unit is RM 34$"

;======================================display validation msg if not digit==========================================

reenterMSG db 0ah,0dh,"Selected number is not in the range!!!"
           db 0ah,0dh,"Please Re-enter!!!$"
digitMSG db 0ah,0dh,"Invalid Input!!! Enter Digit Only !!!$"
           
;=====================================display all calculation msg====================================================

unitMSG db 0ah,0dh,"Please enter number of unit that you want : $"
subtotalMSG db 0ah,0dh,"Total Price before SCharge : RM $"
chargeMSG db 0ah,0dh,"Amount of SCharge (8%) : RM $"
totalMSG db 0ah,0dh,"Total Price after SCharge : RM $"
totalpayMSG db 0dh,0ah," "
            db 0dh,0ah,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            db 0ah,0dh,"Total Pay by Customer : RM $"
totalgiveMSG db 0ah,0dh,"Total Need to Pay Back : RM $"

;============================================report===================================================================

adminMSG1         db 0dh,0ah,"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
                  db 0dh,0ah,"^^      Welcome to the monthly sales!!!     ^^"           
                  db 0dh,0ah,"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" 
                  db 0dh,0ah,"^^                1.January                 ^^"
                  db 0dh,0ah,"^^                2.February                ^^"
                  db 0dh,0ah,"^^                3.March                   ^^"
				  db 0dh,0ah,"^^                4.Go back                ^^"
                  db 0dh,0ah,"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
                  db 0dh,0ah,"Please choose what you want to view : $"

adminMSG2         db 0dh,0ah," "
                  db 0dh,0ah,"Invalid input.Please try again $"

spacesMSG          db 0dh,0ah," "
                   db 0dh,0ah,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~$"

adminMSG3         db 0dh,0ah, "Please choose what you want to view : $"


;=================================display total sales==========================================

       
  monthlysalesMSG1      db 0ah,0dh,"-----------------------------------------------------------------"
                        db 0ah,0dh,"                    The total sales of January                   "
                        db 0ah,0dh,"-----------------------------------------------------------------"
                        db 0ah,0dh," Items        |   Brand         |  total sold out | total sales  "
                        db 0ah,0dh,"--------------|-----------------|-----------------|------------- "
                        db 0ah,0dh,"  Pen         |   star          |       145       |     1450     "
                        db 0ah,0dh,"              |   swams         |       55        |     660      "
                        db 0ah,0dh,"              |   faber castell |       78        |     936      "
                        db 0ah,0dh,"---------------------------------------------------------------- "
                        db 0ah,0dh,"  marker      |   star          |       70        |     1470     "
                        db 0ah,0dh,"              |   swams         |       177       |     2478     "
                        db 0ah,0dh,"              |   faber castell |       45        |     675      "
                        db 0ah,0dh,"-----------------------------------------------------------------"  
                        db 0ah,0dh,"  highlighter |   star          |       34        |     816      "
                        db 0ah,0dh,"              |   swams         |       55        |     1210     "
                        db 0ah,0dh,"              |   faber castell |       23        |     322      "
                        db 0ah,0dh,"-----------------------------------------------------------------"
                        db 0ah,0dh,"  pencil      |   star          |       78        |     1170     "
                        db 0ah,0dh,"              |   swams         |       34        |     714      "
                        db 0ah,0dh,"              |   faber castell |       12        |     408      "
                        db 0ah,0dh,"-----------------------------------------------------------------"
                        db 0ah,0dh,"                                |       806       |    12309     "
                        db 0ah,0dh,"_________________________________________________________________"
                        db 0dh,0ah,"$"


monthlysalesMSG2   db 0ah,0dh,"------------------------------------------------------------------"
                   db 0ah,0dh,"                  The total sales of February                     "
                   db 0ah,0dh,"------------------------------------------------------------------"
                   db 0ah,0dh,"  Items        |  brand         |  total sold out |   total sales "
                   db 0ah,0dh,"---------------|----------------|-----------------|---------------"
                   db 0ah,0dh,"  pen          |  star          |      67         |      670      "
                   db 0ah,0dh,"               |  swams         |      32         |      384      "
                   db 0ah,0dh,"               |  faber castell |      12         |      144      "
                   db 0ah,0dh,"---------------|----------------|-----------------|---------------"
                   db 0ah,0dh,"  marker       |  star          |      66         |      990      "
                   db 0ah,0dh,"               |  swams         |      45         |      945      "
                   db 0ah,0dh,"               |  faber castell |      66         |      2244     "
                   db 0ah,0dh,"--------------------------------------------------|---------------"
                   db 0ah,0dh,"  highlighter  |  star          |      22         |      528      "
                   db 0ah,0dh,"               |  swams         |      23         |      506      "
                   db 0ah,0dh,"               |  faber castell |      43         |      602      "
                   db 0ah,0dh,"--------------------------------------------------|---------------"
                   db 0ah,0dh,"  pencil       |  star          |      12         |      144      "
                   db 0ah,0dh,"               |  swams         |      23         |      322      "
                   db 0ah,0dh,"               |  faber castell |      32         |      480      "
                   db 0ah,0dh,"--------------------------------------------------|---------------"
                   db 0ah,0dh,"                                |      443        |      7959     "
                   db 0ah,0dh,"__________________________________________________________________"
                   db 0dh,0ah,"$"

monthlysalesMSG3 db 0ah,0dh,"------------------------------------------------------------------"
                 db 0ah,0dh,"                  The total sales of March                        "
                 db 0ah,0dh,"------------------------------------------------------------------"
                 db 0ah,0dh," Items        |   Brand         |  total sold out | total sales   "
                 db 0ah,0dh,"--------------|-----------------|-----------------|---------------"
                 db 0ah,0dh,"  Pen         |   star          |       22        |     220       "
                 db 0ah,0dh,"              |   swams         |       33        |     396       "
                 db 0ah,0dh,"              |   faber castell |       78        |     936       "
                 db 0ah,0dh,"------------------------------------------------------------------"
                 db 0ah,0dh,"  marker      |   star          |       70        |     1050      " 
                 db 0ah,0dh,"              |   swams         |       17        |     357       "
                 db 0ah,0dh,"              |   faber castell |       45        |     675       "
                 db 0ah,0dh,"------------------------------------------------------------------"  
                 db 0ah,0dh,"  highlighter |   star          |       34        |     816       "
                 db 0ah,0dh,"              |   swams         |       55        |     1210      "
                 db 0ah,0dh,"              |   faber castell |       23        |     322       " 
                 db 0ah,0dh,"------------------------------------------------------------------"
                 db 0ah,0dh,"  pencil      |   star          |       78        |     1170      "
                 db 0ah,0dh,"              |   swams         |       34        |     714       "
                 db 0ah,0dh,"              |   faber castell |       11        |     165       "
                 db 0ah,0dh,"------------------------------------------------------------------"
                 db 0ah,0dh,"                                |      500        |      8031     "
                 db 0ah,0dh,"__________________________________________________________________"
                 db 0dh,0ah,"$"

monthlysales db ?
admin db ?

monthlysales2 db 0
adminmenu db 0

reply db ?
;--------------------------------------------------start procedure------------------------------------------------
.code
main proc
mov ax,@data
mov ds,ax

;--------------------------------------------code to clear the screen---------------------------------------------
mov ah,00
mov al,02
int 10h

;---------------------------------------------first log in as user-------------------------------------------------
mov cx,0                      ;counter for login 3 attempts

login:
	mov ah,09h
	lea dx,msg1
	int 21h
	
username:
	mov ah,09h
	lea dx,msg2
	int 21h
	
	mov ah,0ah
	lea dx,para_list
	int 21h
	
password:
	mov ah,09h
	lea dx,msg3
	int 21h
	
	mov ah,0ah
	lea dx,pass_list
	int 21h

UserCheck:
	mov	al,user[bx]	;correct username
	cmp	al,userInput[bx]
	jne	CheckPasswordAttend
	loop UserCheck
		
PassCheck:
	mov	al,pass[bx]	;correct username
	cmp	al,passInput[bx]
	jne	CheckPasswordAttend
	loop PassCheck
	
success:
	mov ah,09h
	lea dx,msg5
	int 21h
	jmp start

CheckPasswordAttend:
	inc cx                 ;increase Counter
	cmp cx,3               ;set to 3 attempts 
	jb invalid
	je invalidStop
	
;username or password is incorrect
invalid:			
	mov	ah,09h		;newline
	lea	dx,newLine
	int 21h
	
	mov ah,09h
	lea	dx,msg4
	int	21h
	jmp	username

invalidStop:
	mov ah,09h
	lea dx,alertLoginEnd
	int 21h
	jmp stop
	


;--------------------------------------------ask whether is owner-----------------------------------------------
start:
	mov ah,09h            ;ask whether is owner
	lea dx,ownerMSG
	int 21h

	mov ah,01h
	int 21h
	sub al,30
	mov owner,al

	cmp owner,1
	jne userpage
	jmp ownercheck

	;--------------------------------------------code to clear the screen---------------------------------------------

	userpage:

	mov ah,00
	mov al,02
	int 10h

	mov ax,0
	mov ah,09h                      ;display user msg
	lea dx,userroleMSG
	int 21h

	again:
	mov ax,0
	mov ah,09h                      ;display user menu whether do transaction or logout
	lea dx,user2MSG
	int 21h

	mov ax,0
	mov ah,01h
	int 21h
	sub al,30h
	mov usermenu,al

	cmp usermenu,1
	jne choo
	jmp additem

	choo:
	cmp usermenu,2
	jne choo2
	jmp logoutvalid2

	choo2:
	cmp usermenu,3
	jne choo3
	jmp ownercheck

	choo3:
	mov ax,0
	mov ah,09h                      ;display validation to ask input again
	lea dx,owner3MSG
	int 21h
	jmp again

;---------------------------------------------------------------logout----------------------------------------------
;logout validation user
logoutvalid2:	
	mov ax,0
	mov ah,09h                      ;display validation logout
	lea dx,logoutMSG
	int 21h

	mov ax,0
	mov ah,01h
	int 21h
	sub al,30h
	mov logoutvalidation2,al

	cmp logoutvalidation2,1
	jne choo4
	jmp stop2

stop2:
	mov ax,0
	mov ah,09h                      ;display validation logout
	lea dx,logoutMSG2
	int 21h
	jmp stop

choo4:
	jmp choo3


ownercheck:
	mov ax,0
	mov ah,09h
	lea dx,ownerMSG2
	int 21h
	jmp ownername

;---------------------------------------------check owner password---------------------------------------------

ownername:
	mov ax,0
	mov cx,0                          ;counter to input 3 attempt password only

	mov ah,09h
	lea dx,msg3
	int 21h
	
	mov ah,0ah
	lea dx,pass_list2
	int 21h
	
PassCheck2:
	mov	al,pass2[bx]             	;correct password owner
	cmp	al,passInput2[bx]
	jne	CheckPasswordAttend2
	loop PassCheck2
	
success2:
	mov ah,09h
	lea dx,msg5
	int 21h
	jmp ownerpage

CheckPasswordAttend2:
	inc cx                 ;increase Counter
	cmp cx,3               ;set to 3 attempts 
	jb invalid2
	je invalidStop2
	
invalid2:			
	mov	ah,09h		       ;newline
	lea	dx,newLine
	int 21h
	
	mov ah,09h
	lea	dx,msg4
	int	21h
	jmp	ownername

invalidStop2:
	mov ah,09h
	lea dx,alertLoginEnd
	int 21h
	jmp userpage

;------------------------------------------------choose item and brand-------------------------------------------------
;---------------display item menu--------------
additem:
	mov ax,0
	mov ah,09h
	lea dx,itemMSG
	int 21h

	;------------ask user to input item------------
	mov ah,01h
	int 21h
	sub al,30h
	mov item,al

	;--------compare which item user input---------
	cmp item,1
	jne compare2
	jmp displayPen

compare2:
	cmp item,2
	jne compare3
	jmp displayPencil

compare3:
	cmp item,3
	jne compare4
	jmp displayHighPen

compare4:
	cmp item,4
	jne compare5
	jmp displayMarker

compare5:
	mov ah,09h
	lea dx,reenterMSG
	int 21h
	jmp additem

;-------------------------marker----------------------------------------------(choose item)
displayMarker:
	mov ah,09h
	lea dx,brandMSG
	int 21h

	;--------let user choose brand of marker---------
	mov ah,0
	mov ah,01h
	int 21h
	sub al,30h
	mov brand,al

	mov ah,09h
	lea dx,spaceMSG
	int 21h

	;---compare which brand of marker user input----
	cmp brand,1
	je displaymarkerStar
	cmp brand,2
	je displaymarkerSwam
	cmp brand,3
	je displaymarkerFaber

	mov ah,09h               ;default
	lea dx,reenterMSG
	int 21h
	jmp displayMarker

;-------------------(choose brand)-----------(markerfaber)
displaymarkerFaber:
	mov ah,09h
	lea dx,markerfaberMSG
	int 21h

	mov ax,0
	mov al,markerfaber
	mov thing,al
	jmp calculation

;-------------------(choose brand)-------------(markerstar)
displaymarkerStar:
	mov ah,09h
	lea dx,markerstarMSG
	int 21h

	mov ax,0
	mov al,markerstar
	mov thing,al
	jmp calculation

;-------------------(choose brand)-------------(markerswam)
displaymarkerSwam:
	mov ah,09h
	lea dx,markerswamsMSG
	int 21h

	mov ax,0
	mov al,markerswams
	mov thing,al
	jmp calculation

;------------------pen---------------------------------------------------------(choose item)
displayPen:
	mov ah,09h
	lea dx,brandMSG
	int 21h

	;--------let user choose brand of pen---------
	mov ax,0
	mov ah,01h
	int 21h
	sub al,30h
	mov brand,al

	mov ah,09h
	lea dx,spaceMSG
	int 21h

	;---compare which brand of pen user input----
	cmp brand,1
	je displaypenStar
	cmp brand,2
	je displaypenSwam
	cmp brand,3
	je displaypenFaber

	mov ah,09h                  ;default
	lea dx,reenterMSG
	int 21h
	jmp displayPen

;--------------------(choose brand)------------(penfaber)
displaypenFaber:
	mov ah,09h
	lea dx,penfaberMSG
	int 21h

	mov ax,0
	mov al,penfaber
	mov thing,al
	jmp calculation

;-----------------(choose brand)----------------(penswam)
displaypenSwam:
	mov ah,09h
	lea dx,penswamsMSG
	int 21h

	mov ax,0
	mov al,penswams
	mov thing,al
	jmp calculation

;----------------(choose brand)-----------------(penstar)
displaypenStar:
	mov ah,09h
	lea dx,penstarMSG
	int 21h

	mov ax,0
	mov al,penstar
	mov thing,al
	jmp calculation

;------------------pencil------------------------------------------------------(choose item)
displayPencil:
	mov ah,09h
	lea dx,brandMSG
	int 21h
	;--------let user choose brand of pencil---------
	mov ax,0
	mov ah,01h
	int 21h
	sub al,30h
	mov brand,al

	mov ah,09h
	lea dx,spaceMSG
	int 21h

	;---compare which brand of pencil user input----
	cmp brand,1
	je displaypencilStar
	cmp brand,2
	je displaypencilSwam
	cmp brand,3
	je displaypencilFaber

	mov ah,09h                 ;default
	lea dx,reenterMSG
	int 21h
	jmp displayPencil

;----------------(choose brand)------------------(pencilfaber)
displaypencilFaber:
	mov ah,09h
	lea dx,pencilfaberMSG
	int 21h

	mov ax,0
	mov al,pencilfaber
	mov thing,al
	jmp calculation

;-------------------(choose brand)----------------(pencilswam)
displaypencilSwam:
	mov ah,09h
	lea dx,pencilswamsMSG
	int 21h

	mov ax,0
	mov al,pencilswams
	mov thing,al
	jmp calculation

;----------------(choose brand)-------------------(pencilstar)
displaypencilStar:
	mov ah,09h
	lea dx,pstarMSG
	int 21h

	mov ax,0
	mov al,pencilstar
	mov thing,al
	jmp calculation

;------------------Highlighter-------------------------------------------------(choose item)
	displayHighPen:
	mov ah,09h
	lea dx,brandMSG
	int 21h
	;--------let user choose brand of highlight---------
	mov ax,0
	mov ah,01h
	int 21h
	sub al,30h
	mov brand,al

	mov ah,09h
	lea dx,spaceMSG
	int 21h
	;---compare which brand of highlight user input----
	cmp brand,1
	je displayhighlighterStar
	cmp brand,2
	je displayhighlighterSwam
	cmp brand,3
	je displayhighlighterFaber

	mov ah,09h
	lea dx,reenterMSG
	int 21h
	jmp displayHighPen

;----------------(choose brand)--------------------(highlighterfaber)
displayhighlighterFaber:
	mov ah,09h
	lea dx,highlighterfaberMSG
	int 21h

	mov ax,0
	mov al,highlighterfaber
	mov thing,al
	jmp calculation

;-------------------(choose brand)------------------(highlighterswam)
displayhighlighterSwam:
	mov ah,09h
	lea dx,highlighterswamsMSG
	int 21h

	mov ax,0
	mov al,highlighterswams
	mov thing,al
	jmp calculation

;----------------(choose brand)---------------------(highlighterstar)
displayhighlighterStar:
	mov ah,09h
	lea dx,highlighterstarMSG
	int 21h

	mov ax,0
	mov al,highlighterstar
	mov thing,al
	jmp calculation

;---------------------------------------------user input unit count subtototal-----------------------------------
calculation:
getunit:
	mov ah,09h                        ;let user input unit
	lea dx,unitMSG
	int 21h

	mov ah,01h                        ;unit number 1
	int 21h
	mov unit1,al
	cmp unit1,30h                     ;check if digit
	jae digit
	jb error

digit:
	cmp unit1,39h
	jbe calc
	ja error

error:
	mov ah,09h
	lea dx,digitMSG
	int 21h
	jmp getunit

calc:
	mov ah,01h                        ;unit number 2
	int 21h
	mov unit2,al
	cmp unit2,30h                     ; check if digit
	jae digit2
	jb error

digit2:
	cmp unit2,39h
	jbe calc2
	ja error

calc2:
	mov ax,0                          ;add 2 unit
	sub unit1,30h
	sub unit2,30h
	mov al,unit1
	mul ten
	add al,unit2
	mov unit,al

	mov ax,0                          ;multiple unit with price
	mov al,unit
	mul thing
	mov totalBeforeCharge,al

	mov ax,0                          ;get subtotal number 1
	mov al,totalBeforeCharge
	div ten
	mov q1,al
	mov r1,ah

	mov ax,0                          ;get subtotal number 2,3
	mov al,q1
	div ten
	mov q2,al     
	mov r2,ah      
	add q2,30h
	add r2,30h
	add r1,30h

	mov ah,09h                         ;display unit * price
	lea dx,subtotalMSG
	int 21h

	mov ah,02h
	mov dl,q2
	int 21h

	mov ah,02h
	mov dl,r2
	int 21h

	mov ah,02h
	mov dl,r1
	mov displaytotalBeforeCharge,dl
	int 21h

	mov ax,0                            ;count scharge
	mov al,totalBeforeCharge
	mul charge
	div hun
	mov totalAfterCharge,al

	mov ax,0                           ;get total number 1
	mov al,totalAfterCharge
	div ten
	mov q11,al
	mov r11,ah

	mov ax,0                           ;get total number 2,3
	mov al,q11
	div ten
	mov q21,al     
	mov r21,ah      
	add q21,30h
	add r21,30h
	add r11,30h

	mov ax,0                            ;totalAfterCharge - totalBeforeCharge
	mov al,totalAfterCharge
	sub al,totalBeforeCharge
	mov scharge,al

	mov ah,09h                         ;display scharge price
	lea dx,chargeMSG   
	int 21h

	mov ax,0                           ;get scharge number 1
	mov al,scharge
	div ten
	mov q13,al
	mov r13,ah

	mov ax,0                           ;get scharge number 2,3
	mov al,q13
	div ten
	mov q23,al     
	mov r23,ah      
	add q23,30h
	add r23,30h
	add r13,30h

	mov ah,02h
	mov dl,q23
	int 21h

	mov ah,02h
	mov dl,r23
	int 21h

	mov ah,02h                         ;display scharge
	mov dl,r13
	mov displayscharge,dl
	int 21h

	mov ah,09h                         ;display subtotal after scharge
	lea dx,totalMSG   
	int 21h

	mov ah,02h
	mov dl,q21
	int 21h

	mov ah,02h
	mov dl,r21
	int 21h

	mov ah,02h                         ;display total after scharge
	mov dl,r11
	mov displaytotalAfterCharge,dl
	int 21h

getpay:
	mov ah,09h                        ;let user input totalpay  ;totalpay - total
	lea dx,totalpayMSG
	int 21h

	mov ah,01h                        ;pay number 1
	int 21h
	mov pay1,al
	cmp pay1,30h                     ; check if digit
	jae max3
	jb error2

max3:
	cmp pay1,39h
	jbe calc3
	ja error2

calc3:
	mov ah,01h                        ;pay number 2
	int 21h
	mov pay2,al
	cmp pay2,30h                     ; check if digit
	jae max4
	jb error2

max4:
	cmp pay1,39h
	jbe calc4
	ja error2

calc4:
	mov ah,01h                        ;pay number 3
	int 21h
	mov pay3,al
	cmp pay3,30h                     ; check if digit
	jae max5
	jb error2

error2:
	mov ah,09h
	lea dx,digitMSG
	int 21h
	jmp getpay

max5:
	mov ax,0                          ;add pay1
	mov al,pay1
	sub al,30h
	mul hun
	mov pay1,al

	mov ax,0                          ;add pay2
	mov al,pay2
	sub al,30h
	mul ten
	mov pay2,al

	mov ax,0                          ;add pay3
	mov al,pay3
	sub al,30h
	mov pay3,al

	mov ax,0
	mov al,pay1
	add al,pay2
	add al,pay3
	mov pay,al

	mov ax,0
	mov al,pay
	sub al,totalAfterCharge
	mov totalback,al

	mov ax,0                          ;get totalback number 1
	mov al,totalback
	div ten
	mov q12,al
	mov r12,ah

	mov ax,0                          ;get totalback number 2,3
	mov al,q12
	div ten
	mov q22,al     
	mov r22,ah      
	add q22,30h
	add r22,30h
	add r12,30h

	mov ah,09h                        ;display total give back msg
	lea dx,totalgiveMSG
	int 21h

	mov ah,02h
	mov dl,q22
	int 21h

	mov ah,02h
	mov dl,r22
	int 21h

	mov ah,02h                        ;display total give back
	mov dl,r12
	mov totalgive,dl
	int 21h
	jmp again


;---------------------------------------------owner page-------------------------------------------------
ownerpage:
	;code to clear the screen
	mov ah,00
	mov al,02
	int 10h

	mov ah,09h
	lea dx,msg6                   
	int 21h

	mov ax,0
	mov ah,09h                      ;display owner msg
	lea dx,ownerroleMSG
	int 21h

back:
	mov ax,0
	mov ah,09h                      ;display owner menu whether do transaction or view report
	lea dx,owner2MSG
	int 21h

	mov ax,0
	mov ah,01h
	int 21h
	sub al,30h
	mov ownermenu,al

	cmp ownermenu,1
	jne choose
	jmp additem2

	choose:
	cmp ownermenu,2
	jne choose2
	jmp report

	choose2:
	cmp ownermenu,3
	jne default
	jmp logoutvalid
	

	default:
	mov ax,0
	mov ah,09h                      ;display validation to ask input again
	lea dx,owner3MSG
	int 21h
	jmp back

;-----------------------------------------------------logout-------------------------------------------------------
;logout validation owner
logoutvalid:	
	mov ax,0
	mov ah,09h                      ;display validation logout
	lea dx,logoutMSG
	int 21h

	mov ax,0
	mov ah,01h
	int 21h
	sub al,30h
	mov logoutvalidation,al

	cmp logoutvalidation,1
	jne choose3
	jmp stop3

stop3:
	mov ax,0
	mov ah,09h                      ;display validation logout
	lea dx,logoutMSG2
	int 21h
	jmp userpage

choose3:
	jmp default
	

;------------------------------------------------choose item and brand-------------------------------------------------
;---------------display item menu--------------
additem2:
	mov ax,0
	mov ah,09h
	lea dx,itemMSG
	int 21h

;------------ask user to input item------------
	mov ah,01h
	int 21h
	sub al,30h
	mov item2,al

;--------compare which item user input---------
	cmp item2,1
	jne comp2
	jmp displayPen2

comp2:
	cmp item2,2
	jne comp3
	jmp displayPencil2

comp3:
	cmp item2,3
	jne comp4
	jmp displayHighPen2

comp4:
	cmp item2,4
	jne comp5
	jmp displayMarker2

comp5:
	mov ah,09h
	lea dx,reenterMSG
	int 21h
	jmp additem2

;-------------------------marker----------------------------------------------(choose item)
displayMarker2:
	mov ah,09h
	lea dx,brandMSG
	int 21h

	;--------let user choose brand of marker---------
	mov ah,0
	mov ah,01h
	int 21h
	sub al,30h
	mov brand2,al

	mov ah,09h
	lea dx,spaceMSG
	int 21h

	;---compare which brand of marker user input----
	cmp brand2,1
	je displaymarkerStar2
	cmp brand2,2
	je displaymarkerSwam2
	cmp brand2,3
	je displaymarkerFaber2

	mov ah,09h               ;default
	lea dx,reenterMSG
	int 21h
	jmp displayMarker2

;-------------------(choose brand)-----------(markerfaber)
displaymarkerFaber2:
	mov ah,09h
	lea dx,markerfaberMSG
	int 21h

	mov ax,0
	mov al,markerfaber
	mov thing2,al
	jmp calculation2

;-------------------(choose brand)-------------(markerstar)
displaymarkerStar2:
	mov ah,09h
	lea dx,markerstarMSG
	int 21h

	mov ax,0
	mov al,markerstar
	mov thing2,al
	jmp calculation2

;-------------------(choose brand)-------------(markerswam)
displaymarkerSwam2:
	mov ah,09h
	lea dx,markerswamsMSG
	int 21h

	mov ax,0
	mov al,markerswams
	mov thing2,al
	jmp calculation2

;------------------pen---------------------------------------------------------(choose item)
displayPen2:
	mov ah,09h
	lea dx,brandMSG
	int 21h

	;--------let user choose brand of pen---------
	mov ax,0
	mov ah,01h
	int 21h
	sub al,30h
	mov brand2,al

	mov ah,09h
	lea dx,spaceMSG
	int 21h

	;---compare which brand of pen user input----
	cmp brand2,1
	je displaypenStar2
	cmp brand2,2
	je displaypenSwam2
	cmp brand2,3
	je displaypenFaber2

	mov ah,09h                  ;default
	lea dx,reenterMSG
	int 21h
	jmp displayPen2

;--------------------(choose brand)------------(penfaber)
displaypenFaber2:
	mov ah,09h
	lea dx,penfaberMSG
	int 21h

	mov ax,0
	mov al,penfaber
	mov thing2,al
	jmp calculation2

;-----------------(choose brand)----------------(penswam)
displaypenSwam2:
	mov ah,09h
	lea dx,penswamsMSG
	int 21h

	mov ax,0
	mov al,penswams
	mov thing2,al
	jmp calculation2

;----------------(choose brand)-----------------(penstar)
displaypenStar2:
	mov ah,09h
	lea dx,penstarMSG
	int 21h

	mov ax,0
	mov al,penstar
	mov thing2,al
	jmp calculation2

;------------------pencil------------------------------------------------------(choose item)
displayPencil2:
	mov ah,09h
	lea dx,brandMSG
	int 21h
	;--------let user choose brand of pencil---------
	mov ax,0
	mov ah,01h
	int 21h
	sub al,30h
	mov brand2,al

	mov ah,09h
	lea dx,spaceMSG
	int 21h

	;---compare which brand of pencil user input----
	cmp brand2,1
	je displaypencilStar2
	cmp brand2,2
	je displaypencilSwam2
	cmp brand2,3
	je displaypencilFaber2

	mov ah,09h                 ;default
	lea dx,reenterMSG
	int 21h
	jmp displayPencil2

;----------------(choose brand)------------------(pencilfaber)
displaypencilFaber2:
	mov ah,09h
	lea dx,pencilfaberMSG
	int 21h

	mov ax,0
	mov al,pencilfaber
	mov thing2,al
	jmp calculation2

;-------------------(choose brand)----------------(pencilswam)
displaypencilSwam2:
	mov ah,09h
	lea dx,pencilswamsMSG
	int 21h

	mov ax,0
	mov al,pencilswams
	mov thing2,al
	jmp calculation2

;----------------(choose brand)-------------------(pencilstar)
displaypencilStar2:
	mov ah,09h
	lea dx,pstarMSG
	int 21h

	mov ax,0
	mov al,pencilstar
	mov thing2,al
	jmp calculation2

;------------------Highlighter-------------------------------------------------(choose item)
displayHighPen2:
	mov ah,09h
	lea dx,brandMSG
	int 21h
	;--------let user choose brand of highlight---------
	mov ax,0
	mov ah,01h
	int 21h
	sub al,30h
	mov brand2,al

	mov ah,09h
	lea dx,spaceMSG
	int 21h

	;---compare which brand of highlight user input----
	cmp brand2,1
	je displayhighlighterStar2
	cmp brand2,2
	je displayhighlighterSwam2
	cmp brand2,3
	je displayhighlighterFaber2

	mov ah,09h
	lea dx,reenterMSG
	int 21h
	jmp displayHighPen2

;----------------(choose brand)--------------------(highlighterfaber)
displayhighlighterFaber2:
	mov ah,09h
	lea dx,highlighterfaberMSG
	int 21h

	mov ax,0
	mov al,highlighterfaber
	mov thing2,al
	jmp calculation2

;-------------------(choose brand)------------------(highlighterswam)
displayhighlighterSwam2:
	mov ah,09h
	lea dx,highlighterswamsMSG
	int 21h

	mov ax,0
	mov al,highlighterswams
	mov thing2,al
	jmp calculation2

;----------------(choose brand)---------------------(highlighterstar)
displayhighlighterStar2:
	mov ah,09h
	lea dx,highlighterstarMSG
	int 21h

	mov ax,0
	mov al,highlighterstar
	mov thing2,al
	jmp calculation2

;---------------------------------------------user input unit count subtototal-----------------------------------
calculation2:
getunit2:
	mov ah,09h                        ;let user input unit
	lea dx,unitMSG
	int 21h

	mov ah,01h                        ;unit number 1
	int 21h
	mov unit12,al
	cmp unit12,30h                     ;check if digit
	jae digit22
	jb error22

digit22:
	cmp unit12,39h
	jbe calc22
	ja error22

error22:
	mov ah,09h
	lea dx,digitMSG
	int 21h
	jmp getunit2

calc22:
	mov ah,01h                        ;unit number 2
	int 21h
	mov unit22,al
	cmp unit22,30h                     ; check if digit
	jae digit222
	jb error22

digit222:
	cmp unit22,39h
	jbe calc222
	ja error22

calc222:
	mov ax,0                          ;add 2 unit
	sub unit12,30h
	sub unit22,30h
	mov al,unit12
	mul ten
	add al,unit22
	mov unit20,al

	mov ax,0                          ;multiple unit with price
	mov al,unit20
	mul thing2
	mov totalBeforeCharge2,al

	mov ax,0                          ;get subtotal number 1
	mov al,totalBeforeCharge2
	div ten
	mov q120,al
	mov r120,ah

	mov ax,0                          ;get subtotal number 2,3
	mov al,q120
	div ten
	mov q22,al     
	mov r22,ah      
	add q22,30h
	add r22,30h
	add r120,30h

	mov ah,09h                         ;display unit * price
	lea dx,subtotalMSG
	int 21h

	mov ah,02h
	mov dl,q22
	int 21h

	mov ah,02h
	mov dl,r22
	int 21h

	mov ah,02h
	mov dl,r120
	mov displaytotalBeforeCharge2,dl
	int 21h

	mov ax,0                            ;count scharge
	mov al,totalBeforeCharge2
	mul charge
	div hun
	mov totalAfterCharge2,al

	mov ax,0                           ;get total number 1
	mov al,totalAfterCharge2
	div ten
	mov q112,al
	mov r112,ah

	mov ax,0                           ;get total number 2,3
	mov al,q112
	div ten
	mov q212,al     
	mov r212,ah      
	add q212,30h
	add r212,30h
	add r112,30h

	mov ax,0                            ;totalAfterCharge - totalBeforeCharge
	mov al,totalAfterCharge2
	sub al,totalBeforeCharge2
	mov scharge2,al

	mov ah,09h                         ;display scharge price
	lea dx,chargeMSG   
	int 21h

	mov ax,0                           ;get scharge number 1
	mov al,scharge2
	div ten
	mov q132,al
	mov r132,ah

	mov ax,0                           ;get scharge number 2,3
	mov al,q132
	div ten
	mov q232,al     
	mov r232,ah      
	add q232,30h
	add r232,30h
	add r132,30h

	mov ah,02h
	mov dl,q232
	int 21h

	mov ah,02h
	mov dl,r232
	int 21h

	mov ah,02h                         ;display scharge
	mov dl,r132
	mov displayscharge2,dl
	int 21h

	mov ah,09h                         ;display subtotal after scharge
	lea dx,totalMSG   
	int 21h

	mov ah,02h
	mov dl,q212
	int 21h

	mov ah,02h
	mov dl,r212
	int 21h

	mov ah,02h                         ;display total after scharge
	mov dl,r112
	mov displaytotalAfterCharge2,dl
	int 21h

getpay2:
	mov ah,09h                        ;let user input totalpay  ;totalpay - total
	lea dx,totalpayMSG
	int 21h

	mov ah,01h                        ;pay number 1
	int 21h
	mov pay12,al
	cmp pay12,30h                     ; check if digit
	jae max32
	jb error222

max32:
	cmp pay12,39h
	jbe calc32
	ja error222

calc32:
	mov ah,01h                        ;pay number 2
	int 21h
	mov pay22,al
	cmp pay22,30h                     ; check if digit
	jae max42
	jb error222

max42:
	cmp pay1,39h
	jbe calc42
	ja error222

calc42:
	mov ah,01h                        ;pay number 3
	int 21h
	mov pay32,al
	cmp pay32,30h                     ; check if digit
	jae max52
	jb error222

error222:
	mov ah,09h
	lea dx,digitMSG
	int 21h
	jmp getpay2

max52:
	mov ax,0                          ;add pay1
	mov al,pay12
	sub al,30h
	mul hun
	mov pay12,al

	mov ax,0                          ;add pay2
	mov al,pay22
	sub al,30h
	mul ten
	mov pay22,al

	mov ax,0                          ;add pay3
	mov al,pay32
	sub al,30h
	mov pay32,al

	mov ax,0
	mov al,pay12
	add al,pay22
	add al,pay32
	mov pay20,al

	mov ax,0
	mov al,pay20
	sub al,totalAfterCharge2
	mov totalback2,al

	mov ax,0                          ;get totalback number 1
	mov al,totalback2
	div ten
	mov q122,al
	mov r122,ah

	mov ax,0                          ;get totalback number 2,3
	mov al,q122
	div ten
	mov q222,al     
	mov r222,ah      
	add q222,30h
	add r222,30h
	add r122,30h

	mov ah,09h                        ;display total give back msg
	lea dx,totalgiveMSG
	int 21h

	mov ah,02h
	mov dl,q222
	int 21h

	mov ah,02h
	mov dl,r222
	int 21h

	mov ah,02h                        ;display total give back
	mov dl,r122
	mov totalgive2,dl
	int 21h
	jmp back

;------------------------------------------------generate report--------------------------------------------------

;==========================================choose month=================================
report:
mov ax,0
mov ah,09h                      
lea dx,adminMSG1
int 21h

mov ax,0
mov ah,01h
int 21h
sub al,30h
mov adminmenu,al

cmp adminmenu,1
jne choos1
jmp displayjanuary
 
choos1:
cmp adminmenu,2
jne choos2
jmp displayfebruary

choos2:
cmp adminmenu,3
jne choos3
jmp displaymarch

choos3:
cmp adminmenu,4
jne choos4
jmp back

choos4:
mov ax,0
mov ah,09h                      
lea dx,adminMSG2
int 21h



viewagain:                                                           
mov ax,0
mov ah,09h                      
lea dx,adminMSG3
int 21h



mov ax,0
mov ah,01h
int 21h
sub al,30h
mov adminmenu,al

cmp adminmenu,1
jne chooses1
je displayjanuary
 
chooses1:
cmp adminmenu,2
jne chooses2
je displayfebruary

chooses2:
cmp adminmenu,3
jne chooses3
je displaymarch

chooses3:
cmp adminmenu,4
jne chooses4
jmp back

chooses4:
mov ax,0
mov ah,09h                      
lea dx,adminMSG2
int 21h
jmp wrong

; If the input is valid, proceed with the corresponding month's display
cmp al,1
je displayjanuary
cmp al,2
je displayfebruary
cmp al,3
je displaymarch
cmp al,4
jmp back

wrong:
mov ah, 09h
lea dx, adminMSG2
int 21h
jmp report 

;------------------------------display month

displayjanuary:
mov ah, 09h  
lea dx, monthlysalesMSG1 
int 21h  
jmp viewagain 

displayfebruary:
mov ah, 09h  
lea dx, monthlysalesMSG2 
int 21h  
jmp viewagain 

displaymarch:
mov ah, 09h  
lea dx, monthlysalesMSG3  
int 21h 
jmp viewagain


;=============================admin ask to input============================


mov ah,01h
int 21h
sub al,30h
mov monthlysales,al

	cmp monthlysales,1
	jne compares2
	jmp displayjanuary

compares2:
	cmp monthlysales,2
	jne compares3
	jmp displayfebruary

compares3:
	cmp monthlysales,3
	jne compares4
	jmp displaymarch

compares4:
	cmp monthlysales,4
	jne compares5
	jmp back

compares5:
    jmp wrong

;-------------------------------------------------------end--------------------------------------------------------
stop:
mov ah,4ch
int 21h

main endp
end main
