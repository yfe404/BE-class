#include <sys/mman.h>
#include <string.h>
#include "shellcode.h"




int main()
{
	void* region = mmap(NULL, 
			shellcode_len,
			PROT_WRITE | PROT_EXEC,
			MAP_ANONYMOUS | MAP_PRIVATE,
			-1,
			0);

	if(region == MAP_FAILED) {
		return 1;
	}

	memcpy(region, shellcode, shellcode_len);

	 (*(void (*)()) region)();

	munmap(region, shellcode_len);
    return 0;
}
