#!/bin/bash

set -e

# Get the PHP version and extensions from inputs
PHP_VERSION="${INPUT_PHP-VERSION}"
EXTENSIONS="${INPUT_EXTENSIONS}"

# Update PHP version (if necessary)
echo "Installing PHP $PHP_VERSION with extensions: $EXTENSIONS"
