# Directory structure
SRC_DIR = src
BUILD_DIR = build

# Source files
HTML_FILES = $(wildcard $(SRC_DIR)/*.html)
CSS_FILES = $(wildcard $(SRC_DIR)/*.css)
JS_FILES = $(wildcard $(SRC_DIR)/*.js)

# Build files
BUILD_HTML = $(patsubst $(SRC_DIR)/%.html,$(BUILD_DIR)/%.html,$(HTML_FILES))
BUILD_CSS = $(patsubst $(SRC_DIR)/%.css,$(BUILD_DIR)/%.css,$(CSS_FILES))
BUILD_JS = $(patsubst $(SRC_DIR)/%.js,$(BUILD_DIR)/%.js,$(JS_FILES))

# Default target
all: $(BUILD_DIR) $(BUILD_HTML) $(BUILD_CSS) $(BUILD_JS)

# Create build directory
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# HTML files
$(BUILD_DIR)/%.html: $(SRC_DIR)/%.html
	cp $< $@

# CSS files
$(BUILD_DIR)/%.css: $(SRC_DIR)/%.css
	cp $< $@

# JavaScript files
$(BUILD_DIR)/%.js: $(SRC_DIR)/%.js
	cp $< $@

# Clean target
clean:
	rm -rf $(BUILD_DIR)

# Declare phony targets
.PHONY: all clean
