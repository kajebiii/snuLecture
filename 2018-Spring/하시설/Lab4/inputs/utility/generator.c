#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <sys/time.h>

#define INPUT_SIZE 16

int main(int argc, char **argv)
{
	float input[INPUT_SIZE * 2];
	float result = 0.0f;

	struct timeval tv;
	gettimeofday(&tv, NULL);

	srand(tv.tv_usec);

	for(int i = 0 ; i < INPUT_SIZE * 2 ; i++)
	{
		do
		{
			input[i] = ((float)(rand() % 1000)) / 100.0f;
		}
		while(input[i] < 0.3f);

		printf("%f\n", input[i]);
	}

	for(size_t i = 0 ; i < INPUT_SIZE ; i++)
	{
		result += input[i] * input[i + INPUT_SIZE];
	}

	printf("%f\n", result);
}
