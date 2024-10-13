#include <iostream>
#include "io.h"

int readNumber()
{
    int tmp;
    std::cin >> tmp;
    return tmp;
}

void writeAnswer(int x)
{
    std::cout << x << "\n";
}

