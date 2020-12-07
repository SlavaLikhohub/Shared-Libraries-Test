TARGET := main
LIB1 := var1
LIB2 := var2

BUILD_DIR := build

CC := gcc

CFLAGS := -Wall -O2
LINK := -L$(PWD)/$(BUILD_DIR) -Wl,-rpath=$(PWD)/$(BUILD_DIR)

.PHONY: clean all

all: $(BUILD_DIR)/$(TARGET)

$(BUILD_DIR)/$(TARGET):    \
  $(TARGET).c \
  $(BUILD_DIR)             \
  $(BUILD_DIR)/lib$(LIB1).so  \
  $(BUILD_DIR)/lib$(LIB2).so
	$(CC) $(CFLAGS) $(LINK) $< -o $@ -l$(LIB1) -l$(LIB2)


$(BUILD_DIR):
	mkdir $@

$(BUILD_DIR)/%.o: %.c $(BUILD_DIR)
	$(CC) $(CFLAGS) -c -fPIC $< -o $@
	
$(BUILD_DIR)/%.so: $(BUILD_DIR)/%.o $(BUILD_DIR)
	$(CC) $(CFLAGS) -shared $< -o $@


clean:
	rm -rf $(BUILD_DIR)