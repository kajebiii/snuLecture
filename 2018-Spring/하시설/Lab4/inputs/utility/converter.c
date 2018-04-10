#include <stdio.h>
#include <string.h>
#include <assert.h>

#define INPUT_SIZE 16

int main(int argc, char **argv)
{
	float input[INPUT_SIZE * 2];
	float result = 0.0f;

	for(int i = 0 ; i < INPUT_SIZE * 2 ; i++)
	{
		assert(scanf("%f", input + i) == 1);

		int hex;
		memcpy(&hex, input + i, sizeof(int));
		printf("0x%x\n", hex);

	}

	for(size_t i = 0 ; i < INPUT_SIZE ; i++)
	{
		result += input[i] * input[i + INPUT_SIZE];
	}

	//result printer
	int hex;
	memcpy(&hex, &result, sizeof(int));

	printf("0x%x\n", hex);

}
