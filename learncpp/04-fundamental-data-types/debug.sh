#!/bin/bash

g++ -std=c++2b -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -ggdb -Werror -o a.out "$1"
gdb ./a.out
rm ./a.out
