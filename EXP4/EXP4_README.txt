EXPERIMENT 4 - LL(1) PARSER
==============================

Aim:
To design and implement an LL(1) parser for validating arithmetic expressions.

REQUIREMENTS
------------
1. MSYS2 UCRT64
2. GCC compiler

INSTALLATION / SETUP
--------------------
1. Install MSYS2 from:
   https://www.msys2.org/

2. Open MSYS2 UCRT64 terminal.

3. Update MSYS2:
   pacman -Syu

   If asked to close the terminal, close it, reopen MSYS2 UCRT64,
   and run:
   pacman -Su

4. Check GCC:
   gcc --version

5. If GCC is not installed:
   pacman -S mingw-w64-ucrt-x86_64-gcc

CREATE PROJECT
--------------
cd /c/Users/Afroz/Desktop

mkdir EXP4

cd EXP4

SOURCE FILE
-----------
Place the program file:
exp4.c

COMPILE
-------
gcc exp4.c -o exp4

RUN
---
./exp4

TESTING
-------
Test a valid expression:
2+3*4

Expected:
Valid Expression

Test another valid expression:
(10+5)*2

Expected:
Valid Expression

Test an invalid expression:
2+*3

Expected:
Invalid Expression

Test another invalid expression:
(2+3

Expected:
Invalid Expression

REBUILD AFTER CHANGES
---------------------
gcc exp4.c -o exp4

./exp4

IMPORTANT
---------
Always use the MSYS2 UCRT64 terminal for these commands.
