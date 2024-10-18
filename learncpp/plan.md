---
title: plan
author: Alexander Gröttrup
date: 2024-02-27
---

next chapter: https://www.learncpp.com/cpp-tutorial/arithmetic-operators/

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
  - from 2.1
    > A function whose definition is placed inside another function is a nested
    > function. Unlike some other programming languages, in C++ functions
    > cannot be nested.
    - quiz time 
      - function body
      - "Starting main()\nInn doA()\nIn doB()\nIn doB()\nEnding main()\n"
  - from 2.2
    - `main` is required to return an `int` and cannot be called explicitly _(unlike C)_
    - `EXIT_SUCCESS` and `EXIT_FAILURE` are defined in `cstdlib`
    - quiz time
      - "16", error: nested functions, "", "5\n5\n", error: keyword
      - "Don't Repeat Yourself: avoid duplicate code"
  - from 2.3
    - quiz time
      - "A\nB\n", error: no value for cout 
  - from 2.4
    - unereferenced parameters can be writte without value names
    - quiz time:
      - multiply return type is void instead of int.
      - multiply does not return the product, and there is only on parameter
        used by main
      - "24"
      - in 02-04-quiz.cpp
  - from 2.5
    - quiz time:
      ```
      main: x = 1 y = 2
      doIt: x = 1 y = 4
      doIt: x = 3 y = 4
      main: x = 1 y = 2
      ```
  - from 2.6
    - why use functions? organization, reusability, testing, extensibility,
      abstraction
  - from 2.7
    - > A **forward declaration** allows us to tell the compiler about the
      > existence of an identifier _before_ actually defining the identifier.
    - use a function declaration (also called function prototype)
    - > In C++ all definitions are declarations
    - quiz time
      - the declaration of a function
      - declaration before the definition
      - returntype functionname(parameters);
      - `int doMath(int,int,int,int);`
      - fail compile, fail compile, fail link, runs, runs
  - from 4.8
    - always add new files
  - from 2.10
    - object-like macros are not necessary in C++
  - from 2.11
    - Do not use relative paths for includes
    - each file should explicitly include all header files it needs
  - from 2.12
    - instead of header guard you can use `#pragma once`
    - pragmas are not part of the standard
  - from 2.13
    - design steps:
      1. define your goal: useful to express as user-facing outcomes
      2. define requirements: constraints and capabilities (what not how)
      3. define tools, targets, backup: 
         target architecture, testing / feedback / release strategy
      4. break hard problems down: create tark hierarchies (use as structure)
      5. figure out sequence of events: how to link the tasks together
    - advice:
      - start with simple programs
      - add features over time
      - focus on one area over time
      - test each piece as you go
      - don't invest in perfecting early code
      - optimize for maintainability
- [X] Chapter 3
  - from 3.4 - 3.9
    - why print debugging is not great: code/output clutter, require modification, need to be removed
    - C++ has `std::clog` as logger, but it uses stderr by standard
    - a different 3rd party logger is [plog](https://github.com/SergiusTheBest/plog)
    - [rr debugger](https://rr-project.org/) can rewind
    - mentions local watches
  - from 3.x
    - quiz time 
      - the callstack for q3:
        ```
        #0  d () at 03-XX-q3.cpp:3
        #1  0x0000555555555135 in b () at 03-XX-q3.cpp:9
        #2  0x0000555555555141 in a () at 03-XX-q3.cpp:13
        #3  0x000055555555514d in main () at 03-XX-q3.cpp:17
        ```
      - cin parses based on type. chars are read as ascii
- [X] Chapter 4
  - from 4.2: void to declare no function parameters is deprecated
  - from 4.3: more info to [fundamental types](https://en.cppreference.com/w/cpp/language/types)
  - from 4.4
    - keyword `signed` exists but should not be used
    - overflow for signed integers is undefined behaviour
    - division on integers drops the fractional part
    - results of integer division are perdictable
    - quiz time
      - range of a 5 bit integer would be (-2^4) to (2^4-1): [-16:15]
      - the result of 13/5 for signed integers would be 2
      - the result of -13/5 for signed integers would be -2
  - from 4.5
    - signed integers may be implicitly converted to unsigned
    - use uints when dealing with bin manipulation, w/ well defined wrap-around
      behaviour
    - memory limited context makes use of unsigned number more common
  - from 4.6
    - fixed-width ints can be accessed by including `<cstdint>`
    - `std::int_fast8_t` provides the fastest integer type with a width of
      at least 8 bits
    - `std::uint_least8_t` provides the smallest integer type with a width of at
      least # bits
    - `std::int_8_t` and `std::uint_8_t` might behave like char
    - `std::size_t` is an alias for an undefined unsigned number used for the
      length of objects
  - from 4.7
    - quiz time
      - 3.450e1
      - 4.000e-3
      - 1.23005e2
      - 1.46e5
      - 1.46000001e5
      - 8e-10
      - 3.45000e2
      - 1.46000e5
  - from 4.8
    - floats are always iee 754 4B and 8B
    - 4 bytes give 6-9 significant digits
    - 8 bytes give 15-18 significant digits
    - tool to see floats: https://float.exposed/
  - from 4.9
    - use `std::boolalpha` to parse true and false to bool
  - from 4.10
    - quiz time
      - an early return is a return based on a conditional that returns before
        the whole function is evaluated
  - from 4.11: avoid `wchar_t` if not interfacing with windows api
  - from 4.12
    - use `static_cast<type>(expr)`
  - from 4.X
    - int
    - bool
    - double
    - int
    - float
    - std::int32_t ~~long long~~
    - char
    - std::int16_t
- [X] Chapter 5
  - from 5.1
    - it's more common to use const before the type
    - const-after-type is called east const
    - In C++ const vars are commonnly named  `kEarthGravity` instead of the C
      `EARTH_GRAVITY`
    - Function parameters can be made const, but it is not used anymore
    - const is a *type qualifier* 
  - from 5.5
    - constexpr is always compile-time
    - constexpr does not work with dynamically allocated objects
  - from 5.7
    - historically inline was used as a hint to the compiler
    - in modern C++ `inline` is used to allow multiple definitions of a
      function
    - functions defined in header files would be included in multiple files and
      are made possible this way
    - inline functions can increase compile times significantly
    - > Unlike constexpr functions, constexpr variables are not inline by
      default
  - from 5.8
    - constexpr functions are implicitly inline
    - forward declaration from another TU works only for runtime evaluation
    - there is no way to determine when a constexpr function call is evaluated
    - > C++20 introduced **consteval** which indicates that a function *must*
      > evaluate at compile-time, otherwise a compile error will result. such
      > functions are called immediate functions
    - using consteval as a helper, you can force compile time execution
  - from 5.9
    - `std::getline` to extract a line from stdin
    - `std::cin >> std::ws` to remove whitespace before the first input
    - pass by value copies a string (expensive!)
    - s suffix on a literal makes it a `std::string`: `"foo"s`
    - string literals live in the namespace `std::literals::string_literals`
  - from 5.10
    - C++17 introduced `std::string_view`
    - can use both string styles
    - is usable in constexpr
  - from 5.11
    - > **Warning** A view is dependent on the object being viewed. If the
      > object being viewed is modified or destroyed while the view is still
      > being used, unexpected or undefined behaviour will result.
    - initializing a string view with a string literal leaves the view dangling
    - if a string is modified, all views are invalidated
    - an invalid string view can be revalidated
    - string views can view a substring and do not need to be null terminated
  - from 5.X
    - avoid magic numbers that are missing context. defines are not debuggable
    - 1. `uint8_t` most likely used like char by cout
      2. `.` is not in desired output _and a multicharacter literal_
      3. `16` is a magic number
    - make `calculateBallHeight` a `constexpr`
    - `std::string` owns the actual data while `std::string_view` references
      it. References can become invalid or dangle if the underlying data
      changes or is destroyed.
- [ ] Chapter 6
  - from 6.1
    - order of execution is independent of precedence
    - quiz time
      - x=((3+4)+5)
      - x=(y=z)
      - z *= ((++y)y5)
      - ~~a || (b && (c || d))~~ (a||(b&&c))||d
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
