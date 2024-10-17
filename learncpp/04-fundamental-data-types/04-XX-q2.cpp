#include <iostream>
double readNumber()
{
    std::cout << "Enter a double value: ";
    double temp;
    std::cin >> temp;
    return temp;
}
char readOperation()
{
    std::cout << "Enter +, -, *, or /: ";
    char temp;
    std::cin >> temp;
    return temp;
}
int main()
{
    double  x {readNumber()};
    double  y {readNumber()};
    char c {readOperation()};
    double result;
    if (c=='+')
        result = x+y;
    else if (c=='-')
        result = x-y;
    else if (c=='*')
        result = x*y;
    else if (c=='/')
        result = x/y;
    else
        return 1;
    std::cout << x << ' ' << c << ' ' << y << " is " << result << '\n';

    return 0;
}
