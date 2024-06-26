#include <stdio.h>
#define LIMIT 3

int main() {
    int i, j, k;

    k = 1;
    do {
        for (i = 1; i <= LIMIT; i++) {
            j = 1;

            while (j <= LIMIT) 
                printf("%d", j++);

            printf(" ");
        }

        //puts("");
        k++;
    } while (k <= LIMIT);

    return 0;
}