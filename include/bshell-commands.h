#ifndef BSHELL_COMMANDS
#define BSHELL_COMMANDS

#include "bshell-other-utils.h"

typedef struct {  // structure to allow easy command customization
  const char *command;
  const char *description;
  cmd_func_ptr cmd_func;
} Command;

#endif
