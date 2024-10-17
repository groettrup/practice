#include <iostream>
#include <string>

int main()
{
    std::cout << "Enter the name of person #1: ";
    std::string name1{};
    std::getline(std::cin >> std::ws, name1);

    std::cout << "Enter the age of " << name1 << ": ";
    int age1{};
    std::cin >> age1;

    std::cout << "Enter the name of person #2: ";
    std::string name2{};
    std::getline(std::cin >> std::ws, name2);

    std::cout << "Enter the age of " << name2 << ": ";
    int age2{};
    std::cin >> age2;


    if(age1==age2)
        return 1;
    std::cout << (age1 > age2 ? name1 : name2)
              << " (age " << (age1 > age2 ? age1 : age2)
              << ") is older than "
              << (age1 > age2 ? name2 : name1)
              << " (age " << (age1 > age2 ? age2 : age1)
              << ").\n";
    return 0;
}
