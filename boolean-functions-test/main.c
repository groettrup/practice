/*
 * Test program for a book about boolean functions.
 * I want to be compatible with python so i am using utf8 to encode my strings
 */
#include <locale.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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
    char arr[];
};

/* declarations*/
void print_info(void);
void print_object(const struct object *obj);
struct object* plain_from_chrs(const char* str);

/* definitions */
int main(int argc, char *argv[])
{
    setlocale(LC_ALL, "de_DE.utf8");
    struct object *obj = plain_from_chrs(u8"ö");
    print_object(obj);
    obj->type=OT_KEY;
    print_object(obj);
    print_info();
    return EXIT_SUCCESS;
}

void print_info(){
    printf("objects can be either plaintext, key, or cipher.\n");
}

void print_object(const struct object *obj){
    switch(obj->type){
        case OT_PLAIN:
            printf("'%s'\n",obj->arr);
            return;
        case OT_KEY:
            printf("key: '");
            break;
        case OT_CIPHER:
            printf("cipher: '");
            break;
    }
    for(int i=0; i<obj->size; i++){
        printf("%hhx",obj->arr[i]);
    }
    puts("'\n");
}
    

struct object* plain_from_chrs(const char* str){
    int str_len = strlen(str);
    if(str_len == 0 || str_len == MAX_STR_LEN){
        fprintf(stderr, "Stringlength not in range: %d\n", str_len);
        exit(EXIT_FAILURE);
    }
    struct object *new_obj = malloc(sizeof(struct object) + str_len);
    new_obj->type=OT_PLAIN;
    new_obj->size=str_len;
    strncpy(new_obj->arr, str, new_obj->size);
    return new_obj;
};
