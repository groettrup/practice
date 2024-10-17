#include <iostream>
#include <string>

int main()
{
    std::cout << "Enter your full name: ";
    std::string name{};
    std::cin >> name;

    std::cout << "Enter your favorite color: ";
    name = "Jason";           // change to longer string
    std::cout << name << "\n";

    name = "Jay";             // change to shorter string
    std::cout << name << "\n";

    return 0;
}
