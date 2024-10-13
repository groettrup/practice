#!/bin/bash

g++ -std=c++2b -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -ggdb -Werror -o a.out io.cpp main.cpp
./a.out
rm ./a.out
