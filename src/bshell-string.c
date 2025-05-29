// bshell for munix string utilities implementation
// distributed under the mit license terms
// made by Guillermo Leira Temes <guillermoleiratemes@protonmail.com> Copyright 2025

#include "../include/bshell-string.h"

int cmdlen(char *string, char endsymbol) {
  int counter=0;
  while (string[counter]!=endsymbol) {
    counter++;
  }
  return counter;
}
