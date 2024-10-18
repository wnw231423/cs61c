Some notations:
1. `.globa main`: declare the main entrance when main is not at the top of your `.text`. Also, the .globl directive identifies functions that we want to export to other files. So if .globl don't have main, put main at the top of text.
2. `.data`: where you initialize global values using label and `.word`
3. `.text`: where the code of your program.

Some thing about saving registers:
1. temporary registers are saved by the caller.
2. save registers and ra are saved by the callee.
3. save ra only when calling another logically function. some labels like "loop" and "exit" are just logically within one same function so there is no need to save them.(In other word, you need to jump to other block of code.)
