#include <iostream>
#include <limits>

/* See if my floating point types are using ieee 754
 * 
 * is_iec559 is a static property provided by <limits>
 */
int main()
{
    std::cout << std::numeric_limits<float>::is_iec559 << '\n';
    std::cout << std::numeric_limits<double>::is_iec559 << '\n';
    std::cout << std::numeric_limits<long double>::is_iec559 << '\n';
    float a{};
    double b{};
    long double c{};
    std::cout << sizeof(a) << ", " << sizeof(b) << ", " << sizeof(c) << '\n';
}
