
---

## 42-MiniTalk

# 42 Minitalk

`minitalk` is a small client-server messaging system that communicates via UNIX signals. You must implement:

- **server** – waits for incoming messages (bit-by-bit via `SIGUSR1`/`SIGUSR2`), reconstructs them, and prints to stdout.  
- **client** – sends a string message to the server by encoding each character’s bits into signals.

---

## Table of Contents

- [Features](#features)  
- [Setup & Installation](#setup--installation)  
  - [Compile the library](#compile-the-library)  
- [Usage](#usage)  
- [Bonus](#bonus)  
- [Project Structure](#project-structure)  
- [Author](#author)  


---

## Features

- Bit-wise transmission using `kill()` and signal handlers.  
- Acknowledgement of each character to ensure reliable delivery.  
- Clean API in `minitalk.h` for:
  ```
  void _signal_(int sig, void *handler, int options);
  void _kill_(int server_pid, int sig);
  ```

## Setup & Instalation
```
git clone https://github.com/RubBarkhudaryan/42-Minitalk.git
cd 42-Minitalk
make
```

**This produces two executables:** ```server``` and ``` client ```

## Usage
**Start the server**

```./server```
It will print its PID. Leave it running.

**Send a message**

```./client <SERVER_PID> "Hello, 42!"```
The server will rebuild the string and print Hello, 42! to its stdout.

## Bonus
server_bonus.c / client_bonus.c
Implements more robust acknowledgment logic to confirm receipt of each bit before sending the next.

## Project Structure

```
42-Minitalk/
├── client.c           # Basic client
├── client_bonus.c     # Bonus client with robust ACK
├── server.c           # Basic server
├── server_bonus.c     # Bonus server with enhanced logic
├── minitalk_utils.c   # Internal bit-manipulation helpers
├── libft_functions.c  # ft_putchar, ft_putstr, ft_atoi, …
├── minitalk.h         # Shared prototypes & enums
├── Makefile
└── README.md
```

**Author
Rub Barkhudaryan**
