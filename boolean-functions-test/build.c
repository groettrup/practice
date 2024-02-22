#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

/* build the build program and build main afterwards */
void build_self(){
    int pid = getpid();
    fprintf(stderr, "build self: current pid %d\n", pid);
    int flag = system("gcc build.c -o build.tmp");
    if(flag!=0){
        fprintf(stderr, "selfbuild returned %d, not replacing build file\n", flag);
        exit(EXIT_FAILURE);
    }
    flag = system("mv build.tmp build");
    if(flag!=0){
        fprintf(stderr, "could not overwrite build executable: %d\n", flag);
        exit(EXIT_FAILURE);
    }
    execl("./build", "build_main", "--main",NULL);
}
/* build the main program */
void build_main(){
    int pid = getpid();
    fprintf(stderr, "build main: current pid %d\n", pid);
    int error = system("gcc main.c -o main");
    if(error != 0){
        fprintf(stderr, "could not build main, exit code %d\n", error);
        exit(EXIT_FAILURE);
    }
    fprintf(stderr, "running main...\n");
    execl("./main", "main",NULL);
}

int main(int argc, char *argv[])
{
    int cond_build_all = argc == 1;
    int cond_build_main = argc == 2 && 0 == strncmp(argv[1], "--main", 7);
    if(!cond_build_all && !cond_build_main){
        fprintf(stderr, "Usage: %s [--main]\n", argv[0]);
        exit(EXIT_FAILURE);
    }
    if(cond_build_all){
        build_self();
    } else if(cond_build_main){
        build_main();
    }
    exit(EXIT_SUCCESS);
}
