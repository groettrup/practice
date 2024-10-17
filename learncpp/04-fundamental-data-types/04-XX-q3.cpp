#include <iostream>
const double gravity = 9.8;

double get_initial_height()
{
    std::cout << "Enter the height of the tower in meters: ";
    double temp;
    std::cin >> temp;
    return temp;
}

bool print_update(double secs, double height)
{
    std::cout << "At " << secs << " seconds, the ball is";
    double new_height{height-secs*secs*gravity/2};
    bool on_ground{new_height<=0};
    if(on_ground)
        std::cout << " on the ground\n";
    else
        std::cout << " at heigh: " << new_height << " meters\n";
    return on_ground;
}

int main()
{
    double h{get_initial_height()};
    double s{};
    if(print_update(s, h))
      return 0;
    s += 1;
    if(print_update(s, h))
      return 0;
    s += 1;
    if(print_update(s, h))
      return 0;
    s += 1;
    if(print_update(s, h))
      return 0;
    s += 1;
    if(print_update(s, h))
      return 0;
    s += 1;
    print_update(s, h);
    return 0;
}
