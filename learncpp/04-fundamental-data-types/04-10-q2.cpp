#include <cstdint>
#include <iostream>

int main()
{
    int x;
    std::cout << "Number between 0 and 9 (inclusive): ";
    std::cin >> x;
    if(x==2)
        std::cout << "The digit is prime\n";
    else if(x==3)
        std::cout << "The digit is prime\n";
    else if(x==5)
        std::cout << "The digit is prime\n";
    else if(x==7)
        std::cout << "The digit is prime\n";
    else
        std::cout << "The digit is not prime\n";
}
