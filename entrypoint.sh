#!/bin/bash

set -e

PHP_VERSION=$1
PHP_EXTENSIONS=$2

# Install the specified PHP version
if [ "$PHP_VERSION" = "latest" ]; then
    apt-get install -y php
else
    apt-get install -y php"$PHP_VERSION"
fi

# Install PHP extensions if specified
if [ -n "$PHP_EXTENSIONS" ]; then
    IFS=',' read -r -a extensions <<< "$PHP_EXTENSIONS"
    for ext in "${extensions[@]}"; do
        apt-get install -y php"$PHP_VERSION"-"$ext"
    done
fi

echo "PHP $PHP_VERSION is set up with the following extensions: $PHP_EXTENSIONS"
