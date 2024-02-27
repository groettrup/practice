#include <locale.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <uchar.h>
#include <wchar.h>

static const size_t MAX_STR_LEN = 256;

enum OBJECT_TYPE {
    OT_PLAIN = 0,
    OT_KEY   = 1,
    OT_CIPHER= 2,
};

/* structs */
struct object {
    enum OBJECT_TYPE type;
    int size;
    uint8_t arr[];
};

/* declarations*/
void print_info(void);
struct object* plain_from_wchrs(const wchar_t* str);

/* definitions */
int main(int argc, char *argv[])
{
    setlocale(LC_ALL, "de_DE.utf8");
    plain_from_wchrs(L"This is a test of the widechar system from Gröttrup");
    print_info();
    return EXIT_SUCCESS;
}

void print_info(){
    wprintf(L"objects can be either plaintext, key, or cipher.\n");
}

struct object* plain_from_wchrs(const wchar_t* str){
    int str_len = wcsnlen(str, MAX_STR_LEN);
    if(str_len == 0 || str_len == MAX_STR_LEN){
        fwprintf(stderr, L"Stringlength not in range: %ld\n", str_len);
        exit(EXIT_FAILURE);
    }
    struct object *new_obj = malloc(sizeof(struct object) + sizeof(char32_t) * str_len);
    new_obj->type=OT_PLAIN;
    new_obj->size=str_len;
    wcsncpy((wchar_t*)new_obj->arr, str, new_obj->size);
    return new_obj;
};
