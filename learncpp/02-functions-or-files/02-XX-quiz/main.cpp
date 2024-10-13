#include "io.h"

int main () {
    int x{readNumber()}, y{readNumber()};
    writeAnswer(x+y);
    return 0;
}
