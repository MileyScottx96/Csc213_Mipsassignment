.data
  EnterA: .asciiz "Please Enter a"
  EnterB: .asciiz "Please Enter b"
  EnterC: .asciiz "Please Enter c"
  ErrorLabel: .asciiz "Error!, Complex roots"
  Output1: .asciiz "Your roots are"
  output2: .asciiz "\nAnd\n"
  two: .float 2.0
  four: .float 4.0
  output3: .asciiz "Thanks for using Quad Calculator"
  outputx: .asciiz "Would you like to try again?\n Press 1 to continue or any key to exit"
  .text
loop:
lwc1 $f1,two #$f1isholding2. 0
lwc1$f2,four #$f2isholding4. 0
lwc1 $f3,discriminant_checker #$f3isholding0.0iwanttouseittocheckmydiscriminant
la $a0,EnterA #TellusertoenteranynumberasA
li $v0, 4
syscall
li $v0, 6
syscall
mov.s $f4,$f0 #$f4isholdingA
la $a0,EnterB #TellusertoenteranynumberasB
li $v0, 4
syscall
li $v0, 6
syscall
mov.s $f5,$f0 #$f5isholdingB
la $a0,EnterC #TellusertoenteranynumberasC
li $v0, 4
syscall
li $v0, 6
syscall
mov.s $f6,$f0 #$f6isholdingC
#ijuststartedcalculatingmydiscriminantwhichis##d=b^2-4*a*c
#Andmy4=$f2,a=$f4,b=$f5,c=$f6
mul.s $f7,$f5,$f5 #$f7=b^2
mul.s $f8,$f2,$f4
mul.s $f8,$f8,$f6 #$f8=4*a*c
sub.s $f8,$f7,$f8 #$f8=d=b^2-4*a*c#$f9=d=b^2-4*a*c
mfc1 $t1,$f8 #ichanged$f8to$t1soicancheckifmydiscriminatissmallerthan zero( 0)
blez $t1,error_label #iwanttocheckifthediscriminantissmallerthanzeroorequalto zero
sqrt.s $f10,$f8 #$f10isholdingthesquarerootofthediscriminant
#roots_solver #wecannowstartcalculationwhichis##-b+-sqrtd/2*a
neg.s $f9,$f5 #ijustchangebto- b.likethis$f9=- b
add.s $f23,$f9,$f10 #ijustdidsmall - b+sqrtd
sub.s $f25,$f9,$f10 #ijustdidsmall - b-sqrtd
mul.s $f1,$f1,$f4 #itsjust2*aiwrotefor
div.s $f24,$f23,$f1 #Ithendivided-b+sqrtdby2*a
div.s $f26,$f25,$f1 #Ithendivided- b-sqrtdby2*a
la $a0,output1
li $v0, 4
syscall
mov.s $f12,$f24
li $v0, 2
syscall
la $a0,press_and
li $v0, 4
syscall
mov.s $f12,$f26
li $v0, 2
syscall
la $a0,press_question
li $v0, 4
syscall
li $v0, 5
syscall
move $t4,$v0
li $t3, 1
beq $t4,$t3,loop
b exit
Errorlabel :
la $a0,press_error
li $v0, 4
syscall
la $a0,press_question
li $v0, 4 $t4,$v0
li $t3, 1
beq $t4,$t3,loop
b exit
exit :
la $a0,press_goodbye
li $v0, 4
syscall
li $v0, 10
syscall