EXPERIMENT 7 - THREE ADDRESS CODE USING LEX AND YACC
=======================================================

WINDOWS SETUP AND RUN COMMANDS
==============================

1. Install MSYS2
----------------
Download and install MSYS2 from:
https://www.msys2.org/

Open:
MSYS2 UCRT64


2. Update MSYS2
---------------
pacman -Syu

If asked to close the terminal, close it.

Open MSYS2 UCRT64 again and run:

pacman -Su


3. Install Flex
---------------
pacman -S mingw-w64-ucrt-x86_64-flex

Check:

flex --version


4. Install Bison (YACC)
-----------------------
Check available package:

pacman -Ss bison

Install:

pacman -S bison

Check:

bison --version


5. Install GCC
--------------
Check:

gcc --version

If GCC is not installed:

pacman -S mingw-w64-ucrt-x86_64-gcc


6. Create Experiment Folder
---------------------------
Go to Desktop:

cd /c/Users/Afroz/Desktop

Replace "Afroz" with your Windows username if required.

Create folder:

mkdir EXP7

Enter folder:

cd EXP7


7. Put the Code Files in the Folder
-----------------------------------
Place these two files inside EXP7:

ex4.l
ex4.y


8. Generate YACC Parser
-----------------------
bison -d ex4.y

This generates:

ex4.tab.c
ex4.tab.h


9. Generate LEX C File
----------------------
flex ex4.l

This generates:

lex.yy.c


10. Compile the Program
-----------------------
gcc lex.yy.c ex4.tab.c -o ex4


11. Run the Program
-------------------
./ex4


12. Test the Program
--------------------
Example input:

(12+8)*3-18/(2+1)

The generated TAC should look like:

t1 = 12 + 8
t2 = t1 * 3
t3 = 2 + 1
t4 = 18 / t3
t5 = t2 - t4
Result: t5


13. If You Need to Run It Again
-------------------------------
./ex4


14. If You Modify ex4.l or ex4.y
--------------------------------
Run:

bison -d ex4.y

flex ex4.l

gcc lex.yy.c ex4.tab.c -o ex4

./ex4


IMPORTANT
---------
Always use the MSYS2 UCRT64 terminal.

The complete execution flow is:

ex4.y
  ->
bison -d ex4.y
  ->
ex4.tab.c + ex4.tab.h

ex4.l
  ->
flex ex4.l
  ->
lex.yy.c

lex.yy.c + ex4.tab.c
  ->
gcc
  ->
ex4

ex4
  ->
./ex4
  ->
Enter expression
  ->
Three Address Code
