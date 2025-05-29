# Makefile to compile all .c files from 'src/' into a static library (.a)

# Directories
SRCDIR := src
BUILDDIR := build

# Output static library name
# This will be your compiled module. Link your OS against this .a file.
TARGET_A := $(BUILDDIR)/libshell_module.a

# Compiler (change to your cross-compiler if needed, e.g., i686-elf-gcc)
CC := gcc
# Archiver (for creating static libraries)
AR := ar

# Compilation flags for individual .o files
# -c: Compile, don't link
# -ffreestanding: Essential for OS development
# -nostdlib: Don't link standard libraries
# -I$(SRCDIR): Include src directory for headers
CFLAGS := -c -ffreestanding -nostdlib -I$(SRCDIR)

# Find all .c files in the source directory
C_SOURCES := $(wildcard $(SRCDIR)/*.c)

# Convert .c source file paths to .o object file paths in the build directory
O_OBJECTS := $(patsubst $(SRCDIR)/%.c, $(BUILDDIR)/%.o, $(C_SOURCES))

.PHONY: all
all: $(TARGET_A)

# Rule to create the static library from all individual .o files
$(TARGET_A): $(O_OBJECTS)
	@echo "Archiving object files into static library: $@"
	$(AR) rcs $@ $(O_OBJECTS)
	@echo "Module compilation complete."

# Rule to compile each .c file into its corresponding .o file
$(BUILDDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(BUILDDIR) # Ensure build directory exists
	@echo "Compiling $< to $@"
	$(CC) $(CFLAGS) $< -o $@

.PHONY: clean
clean:
	@echo "Cleaning build files..."
	@rm -f $(TARGET_A) $(O_OBJECTS)
	@rm -rf $(BUILDDIR)
	@echo "Clean-up complete."
