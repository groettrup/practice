#!/bin/bash

g++ -std=c++2b -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -Werror -O2 -DNDEBUG -o a.out "$1"
./a.out
rm ./a.out
