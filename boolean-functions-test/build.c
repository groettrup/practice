#include <linux/limits.h>
#include <sys/inotify.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

void handle_events(){
    puts("Event handled :O");
}

/* build the build program and build main afterwards */
void build_self(){
    int flag = system("gcc -std=c11 build.c -o build.tmp");
    if(flag!=0){
        fprintf(stderr, "selfbuild returned %d, not replacing build file\n", flag);
        exit(EXIT_FAILURE);
    }
    flag = system("mv build.tmp build");
    if(flag!=0){
        fprintf(stderr, "could not overwrite build executable: %d\n", flag);
        exit(EXIT_FAILURE);
    }
}
/* build the main program */
void build_main(){
    int error = system("gcc -std=c11 main.c -o main");
    if(error != 0){
        fprintf(stderr, "could not build main, exit code %d\n", error);
        exit(EXIT_FAILURE);
    }
    fprintf(stderr, "running main...\n");
}

int main(int argc, char *argv[])
{
    int cond_build_all = argc == 1;
    int cond_build_main = argc == 2 && 0 == strncmp(argv[1], "--main", 7);
    int cond_build_watch = argc == 2 && 0 == strncmp(argv[1], "--watch", 8);
    if( !cond_build_all
     && !cond_build_main
     && !cond_build_watch){
        fprintf(stderr, "Usage: %s [--main|--watch]\n", argv[0]);
        exit(EXIT_FAILURE);
    }
    if(cond_build_all){
        build_self();
        execl("./build", "build_main", "--main",NULL);
    } else if(cond_build_main){
        build_main();
        execl("./main", "main",NULL);
    } else if(cond_build_watch){
        int fd = inotify_init1(0);
        if(fd==-1){
            fputs("failed to initialize inotify", stderr);
            exit(EXIT_FAILURE);
        }
        int error = inotify_add_watch(fd, ".", IN_MODIFY);
        if(error==-1){
            fputs("failed to add inotify watch",stderr);
            exit(EXIT_FAILURE);
        }
        const int struct_size = sizeof(struct inotify_event)+NAME_MAX+1;
        struct inotify_event *event = malloc(struct_size);
        read(fd,event, struct_size);
        printf("change detected: %s\n", event->name);
        build_self();
        system("./build --main");
        execl("./build", "build_watch", "--watch", NULL);
    }
    exit(EXIT_SUCCESS);
}
