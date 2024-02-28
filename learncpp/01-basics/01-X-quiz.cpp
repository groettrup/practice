#include <iostream>

int main()
{
    int a, b;
    std::cout << "Enter an integer: ";
    std::cin >> a;
    std::cout << "Enter an integer: ";
    std::cin >> b;
    std::cout << a << " + " << b << " is " << a + b << ".\n";
    std::cout << a << " - " << b << " is " << a - b << ".\n";
    return 0;
}
