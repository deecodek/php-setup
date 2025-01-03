FROM php:8.4-cli

# Install required extensions
RUN apt-get update && apt-get install -y \
    libzip-dev \
    && docker-php-ext-install zip \
    && docker-php-ext-install bcmath bz2 calendar exif gd gettext imagick intl mbstring mysqli opcache pcntl pdo pdo_mysql pdo_pgsql soap sockets sysvmsg sysvsem sysvshm xml xsl redis gmp tidy \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
