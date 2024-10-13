#include <iostream> // for std::cout

// Definition of user-defined function doPrint()
// toPrint() is called function in this example
void doPrint()
{
    std::cout << "In doPrint()\n";
}

// Definition of user-defined function main()
int main()
{
    std::cout << "Starting main()\n";
    doPrint(); // Interrupt main() by making a function call to doPrint.
    doPrint(); // do Print() called for the second time
               // main() is the caller.
    std::cout << "Ending main()\n"; // This statement is executed after doPrint ends

    return 0;
}
