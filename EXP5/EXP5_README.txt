EXPERIMENT 5 - SDD USING LEX
==============================

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


4. Install GCC
--------------
Check:

gcc --version

If GCC is not installed:

pacman -S mingw-w64-ucrt-x86_64-gcc

Then check:

gcc --version


5. Create Experiment Folder
---------------------------
Go to Desktop:

cd /c/Users/Afroz/Desktop

Create folder:

mkdir EXP5

Enter folder:

cd EXP5


6. Put the Code File in the Folder
----------------------------------
Place the prepared LEX file inside the EXP5 folder:

sdd.l

You can create/edit it using:

nano sdd.l

Save:
Ctrl + O
Enter

Exit:
Ctrl + X


7. Generate the C File
----------------------
Run:

flex sdd.l

This generates:

lex.yy.c


8. Compile the Program
----------------------
Run:

gcc lex.yy.c -o sdd


9. Run the Program
------------------
Run:

./sdd


10. Test the Program
--------------------
Enter:

10+5*2

Expected:

Result = 20


Enter:

(10+5)*2

Expected:

Result = 30


Enter:

20/5+3*2

Expected:

Result = 10


11. If You Need to Run It Again
-------------------------------
Just run:

./sdd


12. If You Modify sdd.l
-----------------------
Run these commands again:

flex sdd.l

gcc lex.yy.c -o sdd

./sdd


IMPORTANT
---------
Always use the MSYS2 UCRT64 terminal.

The complete execution flow is:

sdd.l
  ->
flex sdd.l
  ->
lex.yy.c
  ->
gcc
  ->
sdd
  ->
./sdd
  ->
Enter expression
  ->
Result
