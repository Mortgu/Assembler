#include <stdio.h>
int main() {
    int year;
    
    // 2. possibility:
    // Conditional Statement with Logical Operators
    if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
    printf("%d is a leap year.\n", year);
    } else {
    printf("%d is no leap year.", year);
    }
}