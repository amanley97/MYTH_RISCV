#include <stdio.h>
#include <math.h>

int main() {
	unsigned long long int max = (unsigned long long int) (pow(2,64) -1);
	printf("highest number represented by unsigned long long int is %llu\n", max);

	long long int s_max = (long long int) (pow(2,63) -1);
        printf("highest number represented by long long int is %lld\n", s_max);

	long long int s_min = (long long int) (pow(2,63) *-1);
	printf("lowest number represented by long long int is %lld\n", s_min);

	return 0;
}
