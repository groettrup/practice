#include <iostream>
#include <string>

int main()
{
    std::string name{"Alex"}; // init name w/ string literal
    std::cout << name << "\n";

    name = "Jason";           // change to longer string
    std::cout << name << "\n";

    name = "Jay";             // change to shorter string
    std::cout << name << "\n";

    return 0;
}
