#include <iostream>
#include <string>
#include <ctime>

void delay(int milliseconds) {
    clock_t time_end = clock() + milliseconds * CLOCKS_PER_SEC / 1000;
    while (clock() < time_end);
}

int main() {
    std::string name = "Stepan";  // Replace "YourName" with your actual name

    for (char c : name) {
        std::cout << c << std::flush;  // Flush the buffer immediately
        delay(300);  // Delay for 0.3 seconds
    }

    std::cout << std::endl;

    return 0;
}
