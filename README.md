# 42 Push-Swap

`push_swap` is a sorting algorithm project where you must sort a stack of integers using a minimal set of operations. You write two programs:

1. **push_swap** – calculates and prints the list of operations to sort the given numbers.
2. **checker** – reads a list of operations and verifies whether they sort the stack correctly.

---

## Table of Contents

- [Features](#features)  
- [Usage](#usage)  
  - [Compile the library](#compile-the-library)  
  - [Running push_swap](#running-push_swap)  
  - [Running checker](#running-checker)  
- [Rules & Operations](#rules--operations)  
- [Project Structure](#project-structure)  
- [Author](#author)  
- [License](#license)  

---

## Features

- Validates input (integers only, no duplicates, within 32-bit range).  
- Supports the following operations:
  - **Swap:** `sa`, `sb`, `ss`  
  - **Push:** `pa`, `pb`  
  - **Rotate:** `ra`, `rb`, `rr`  
  - **Reverse Rotate:** `rra`, `rrb`, `rrr`  
- Optimized for minimal moves on small (2–5 elems) and large stacks.  

---

## Usage

### Compile the library (bash)

```
git clone https://github.com/RubBarkhudaryan/42-Push-Swap.git
cd 42-Push-Swap
make
```

# This builds:

**push_swap (your main sorting program)**, **checker_linux (the checker for Linux)**

Running push_swap
bash
Копировать
Редактировать
./push_swap 3 2 5 1 4
It will print a sequence of operations, one per line, that, when applied to the stack, sorts it in ascending order.

## Running checker
You can pipe operations into the checker to verify:
# Example: check a correct solution
./push_swap 3 2 5 1 4 | ./checker_linux 3 2 5 1 4
# Output should be "OK"

# Example: check an incorrect sequence
echo -e "sa\nra\npb" | ./checker_linux 3 2 5 1 4
# Output should be "KO"

## Rules & Operations
# No global variables

Allowed functions: only those you implement in your own libft (no <stdlib.h> conversion helpers, except for memory management)
Memory leaks must be avoided
Errors (invalid input, memory failures) must print Error\n to stderr and exit with status 1

# Project Structure

```
42-Push-Swap/
├── bonus/               # Optional extra features
├── libft/               # Your custom libft with helpers
├── src/                 # All push_swap and checker sources
│   ├── ps_main.c
│   ├── ps_validation.c
│   ├── ps_init_stack.c
│   ├── ps_sort_stack.c
|   ├── pushswap.h       
│   ├── ... (ops, utils, indexing)
├── checker_linux        # Built checker executable
├── push_swap            # Built push_swap executable
├── Makefile
└── README.md
```
**Author
Rub Barkhudaryan**
