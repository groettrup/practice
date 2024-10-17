#include <iostream>

void print_ascii(int c)
{
    std::cout << "', which has ASCII code " << c << '\n';
}
int main()
{
    std::cout << "Enter a single character: ";
    char c;
    std::cin >> c;
    std::cout << "You entered '" << c;
    print_ascii(c);
}
