EXPERIMENT 6 - LEX AND YACC
============================

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
pacman -Ss bison

Then install:

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

Create folder:

mkdir EXP6

Enter folder:

cd EXP6


7. Put the Code Files in the Folder
-----------------------------------
Place these two files inside EXP6:

type.l
type.y

You can create/edit them using:

nano type.l
nano type.y

OR copy the already prepared files into the EXP6 folder.


8. Generate YACC Parser
-----------------------
Run:

bison -d type.y

This generates:

type.tab.c
type.tab.h


9. Generate LEX C File
----------------------
Run:

flex type.l

This generates:

lex.yy.c


10. Compile the Program
-----------------------
Run:

gcc lex.yy.c type.tab.c -o type


11. Run the Program
-------------------
Run:

./type


12. Test Inputs
---------------
Enter:

123

Expected:

Type: INTEGER


Enter:

123.897

Expected:

Type: FLOAT


Enter:

God

Expected:

Type: CHAR/STRING


13. Test Invalid Input
----------------------
Enter:

123asd

This should produce a parse error because the input contains
more than one token/type in a single statement.


14. If You Need to Run It Again
-------------------------------
Just run:

./type


15. If You Modify type.l or type.y
----------------------------------
Run these commands again:

bison -d type.y

flex type.l

gcc lex.yy.c type.tab.c -o type

./type


IMPORTANT
---------
Always use the MSYS2 UCRT64 terminal.

The complete execution flow is:

type.y
  ->
bison -d type.y
  ->
type.tab.c + type.tab.h

type.l
  ->
flex type.l
  ->
lex.yy.c

lex.yy.c + type.tab.c
  ->
gcc
  ->
type

type
  ->
./type
  ->
Output
