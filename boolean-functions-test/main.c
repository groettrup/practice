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
void print_object(const struct object *obj);
static char find_offset(char c);
struct object* plain_from_chrs(const char* str);
struct object* key_from_hex(const char* str);

/* definitions */
int main(int argc, char *argv[])
{
    setlocale(LC_ALL, "de_DE.utf8");
    struct object *obj;
    obj = plain_from_chrs(u8"Brötchen");
    obj->type=OT_KEY;
    print_object(obj);
    obj = key_from_hex(u8"4272c3b6746368656e");
    print_object(obj);
    return EXIT_SUCCESS;
}

void print_object(const struct object *obj){
    switch(obj->type){
        case OT_PLAIN:
            printf("pt (len=%d): '%s'\n",obj->size,obj->arr);
            return;
        case OT_KEY:
            printf("key(len=%d): '",obj->size);
            break;
        case OT_CIPHER:
            printf("ct (len=%d): '",obj->size);
            break;
    }
    for(int i=0; i<obj->size; i++){
        printf("%hhx",obj->arr[i]);
    }
    puts("'\n");
}

struct object* key_from_hex(const char* str){
    int str_len = strlen(str);
    if(str_len == 0 || str_len == MAX_STR_LEN || str_len % 2 != 0){
        fprintf(stderr, "Stringlength not in range: %d\n", str_len);
        exit(EXIT_FAILURE);
    }
    struct object *new_obj = malloc(sizeof(struct object) + str_len / 2 + 1);
    new_obj->type=OT_KEY;
    new_obj->size=str_len/2;
    for(int i=0;i<new_obj->size;i++){
        char c, o;
        c = str[2*i];
        o = find_offset(c);
        new_obj->arr[i] = (c - o) << 4;
        c = str[2*i+1];
        o = find_offset(c);
        new_obj->arr[i] += (c - o);
    }
    return new_obj;
}

struct object* plain_from_chrs(const char* str){
    int str_len = strlen(str);
    if(str_len == 0 || str_len == MAX_STR_LEN){
        fprintf(stderr, "Stringlength not in range: %d\n", str_len);
        exit(EXIT_FAILURE);
    }
    struct object *new_obj = malloc(sizeof(struct object) + str_len + 1);
    new_obj->type=OT_PLAIN;
    new_obj->size=str_len;
    strncpy(new_obj->arr, str, new_obj->size);
    return new_obj;
};

static char find_offset(char c){
    if(c <= 'Z' && c >= 'A') return ('A' - 10);
    if(c <= 'z' && c >= 'a') return ('a' - 10);
    if(c <= '9' && c >= '0') return '0';
    fprintf(stderr,"could not find character range for hex char %c\n", c);
    exit(EXIT_FAILURE);
}
