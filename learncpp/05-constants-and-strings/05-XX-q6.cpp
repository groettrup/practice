#include <iostream>
#include <string_view>

constexpr std::string_view getQuantityPhrase(int n){
    if(n < 0)
        return "negative";
    else if(n == 0)
        return "no";
    else if(n == 1)
        return "a single";
    else if(n == 2)
        return "a couple of";
    else if(n == 3)
        return "a few";
    else
        return "many";
}

constexpr std::string_view getApplesPluralized(int n){
    std::string_view res{"apples"};
    if(n == 1)
        res.remove_suffix(1);
    return res;
}

consteval std::string_view getMaryQuant(int n){
    return getQuantityPhrase(n);
}

consteval std::string_view getMaryPlural(int n){
    return getApplesPluralized(n);
}
int main()
{
    constexpr int maryApples{3};
    std::cout << "Mary has " << getMaryQuant(maryApples) << ' '
              << getMaryPlural(maryApples) << ".\n";
    std::cout << "How many apples do you have? ";
    int numApples{};
    std::cin >> numApples;

    std::cout << "You have " << getQuantityPhrase(numApples) << ' '
              << getApplesPluralized(numApples) << ".\n";
    return 0;
}
