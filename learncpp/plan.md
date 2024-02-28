---
title: plan
author: Alexander Gröttrup
date: 2024-02-27
---

next chapter: https://www.learncpp.com/cpp-tutorial/introduction-to-functions/

# Chapter List

- [x] Chapter 0
  - from 0.9:
    > Add `-ggdb` to the command line when debugging and `-O2 -DNDEBUG` for
    > release builds. Use the former for now.
  - from 0.10:
    > You can disable compiler extensions by adding the -pedantic-errors flag
    > to the compile command line.
  - from 0.11:
    > Add the following flags to your command line: `-Wall` `-Weffc++` `-Wextra`
    > `-Wconversion` `-Wsign-conversion`
    > 
    > Add the following flag to your command line to treat your warnings as
    > errors: `-Werror`
    > 
    > ## best practices
    > Don’t let warnings pile up. Resolve them as you encounter them (as if
    > they were errors). Otherwise a warning about a serious issue may be lost
    > amongst warnings about non-serious issues.
    > 
    > Turn your warning levels up to the maximum, especially while you are
    > learning. It will help you identify possible issues.
    > 
    > Enable “Treat warnings as errors”. This will force you to resolve all
    > issues causing warnings.  
  - from 0.12:
    > For GCC/G++/Clang, you can use compiler options `-std=c++11`, `-std=c++14`,
    > `-std=c++17`, `-std=c++20`, or `-std=c++23` (to enable C++11/14/17/20/23
    > support respectively). If you have GCC 8 or 9, you’ll need to use
    > `-std=c++2a` for C++20 support instead. You can also try the latest code
    > name (e.g. `-std=c++2c`) for experimental support for features from the
    > upcoming language standard.
- [x] Chapter 1
  - from 1.1 - quiz time: 
    - a statement declares an action of the program.
    - a function executes a number of statements based on an input.
    - all programs need a main function.
    - the program starts with ~~the loader and then~~ the main function.
    - statements are often ended with a semicolon.
    - a syntax error means that the program could not be parsed.
    - the c++ standard library is a collection of useful statements.
  - from 1.2:
    - warning:
      > Don’t use multi-line comments inside other multi-line comments.
      > Wrapping single-line comments inside a multi-line comment is okay.
    - best practice:
      > Comment your code liberally, and write your comments as if speaking to
      > someone who has no idea what the code does. Don’t assume you’ll
      > remember why you made specific choices.
  - from 1.3 - quiz time:
    - data is information processed by the computer
    - values are the different states a variable can be in.
    - a variable is a name for an object.
    - the identifier is the name of a variable.
    - the type describes the meaning and layout of the data in a variable
    - integer is the type for whole numbers that can be represented using 4
      bytes
  - from 1.4
    - > There are 6 ways to initialize a variable.
      1. default initialization (`int b;`): no initializer provided, variable
         is left uninitialized (with undetermined value) in most cases.
      1. copy initialization (`int b=5;`): less efficient than other ways. Used
         whenever values are implicitly copied.
      1. direct initialization (`int b(5)`): largely superseded by list
         initialization.
      1. list initialization (`int a { 5 };int b = { 5 }`): 
         > ## Best practice
         > Prefer direct list initialization (or value initialization) for
         > initializing your variables.
      1. value initialization (`int b {}`): if the variable is initialized to 0
         it is called zero initialization.
    - `[[maybe_unused]]`: attribute before variable to disable warning.
    - quiz time:
      - initialization happens at definition. assignments can happen to defined
        variables.
      - i should prefer list initialization.
      - value initialization uses a default value. default initialization
        leaves the value undetermined.
  - from 1.5:
    - `std::cout` is buffered, `std::endl` adds a newline and flushes the
      buffer.
    - quiz time:
      - h -> 0
      - 12.5 -> 12
      - -3 -> -3
      - Hello -> 0
      - 3000000000000 -> 2147483647
      - 1234abc -> 1234
      - abc1234 -> 0
  - from 1.6:
    - default initialization does not seem to work
    - quiz time:
      - an uninitialized variable does not hold a determined variable. it is
        undefined behaviour.
      - undefined behaviour is everything that is not specified by the
        language spec or the implementation.
  - from 1.7
    - > Identifier names that start with a capital letter are typically used
      > for user-defined types (such as structs, classes, and enumerations,
      > all of which we will cover later).
    - don't start variables with underscores
    - quiz time
      - conv, unconv, unconv, invalid, conv, invalid, conv, invalid, conv 
  - from 1.8
    > quoted text seperated by nothing but whitespace […] will be concatenated
  - from 1.9
    - number of operants an operator takes is called **arity**.
- [ ] Chapter 2
- [ ] Chapter 3
- [ ] Chapter 4
- [ ] Chapter 5
- [ ] Chapter 6
- [ ] Chapter 7
- [ ] Chapter 8
- [ ] Chapter 9
- [ ] Chapter 10
- [ ] Chapter 11
- [ ] Chapter 12
- [ ] Chapter 13
- [ ] Chapter 14
- [ ] Chapter 15
- [ ] Chapter 16
- [ ] Chapter 17
- [ ] Chapter 18
- [ ] Chapter 19
- [ ] Chapter 20
- [ ] Chapter 21
- [ ] Chapter 22
- [ ] Chapter 23
- [ ] Chapter 24
- [ ] Chapter 25
- [ ] Chapter 26
- [ ] Chapter 27
- [ ] Appendix A
- [ ] Appendix B
- [ ] Appendix C

# Changelog

- 2024-02-27:
  - read complete chapter 0
  - added new anki folder 'practice' and tag 'learncpp'
