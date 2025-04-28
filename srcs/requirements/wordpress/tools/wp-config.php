<?php
/**
 * WordPress Configuration File
 */

// ** Database settings ** //
define( 'DB_NAME', getenv('database_name') );
define( 'DB_USER', getenv('mysql_user') );
define( 'DB_PASSWORD', getenv('mysql_password') );
define( 'DB_HOST', getenv('mysql_host') );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 * You can generate these using the WordPress secret-key service:
 * {@link https://api.wordpress.org/secret-key/1.1/salt/}
 */
define('AUTH_KEY',         getenv('AUTH_KEY'));
define('SECURE_AUTH_KEY',  getenv('SECURE_AUTH_KEY'));
define('LOGGED_IN_KEY',    getenv('LOGGED_IN_KEY'));
define('NONCE_KEY',        getenv('NONCE_KEY'));
define('AUTH_SALT',        getenv('AUTH_SALT'));
define('SECURE_AUTH_SALT', getenv('SECURE_AUTH_SALT'));
define('LOGGED_IN_SALT',   getenv('LOGGED_IN_SALT'));
define('NONCE_SALT',       getenv('NONCE_SALT'));
/**#@-*/

// Table prefix
$table_prefix = 'wp_';

// Debugging mode
define( 'WP_DEBUG', true );

// Site URL ve Home URL
if ( ! defined( 'WP_SITEURL' ) ) {
    define( 'WP_SITEURL', 'https://' . getenv('DOMAIN') );
}
if ( ! defined( 'WP_HOME' ) ) {
    define( 'WP_HOME', 'https://' . getenv('DOMAIN') ); }

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
