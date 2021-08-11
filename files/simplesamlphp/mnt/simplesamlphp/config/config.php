<?php
$config = [
	'usenewui' => false,
    'baseurlpath' => 'https://simplesaml.owncloud.test/simplesaml/',
    'certdir' => 'cert/',
    'loggingdir' => 'log/',
    'datadir' => 'data/',
    'tempdir' => '/tmp/ssp',
    'technicalcontact_name' => 'Administrator',
    'technicalcontact_email' => 'na@example.org',
    'timezone' => null,
    'secretsalt' => 'saltydevidp',
    'auth.adminpassword' => '1234',
    'admin.protectindexpage' => false,
    'admin.protectmetadata' => false,
    'admin.checkforupdates' => true,
    'trusted.url.domains' => [],
    'trusted.url.regex' => false,
    'enable.http_post' => false,
    'assertion.allowed_clock_skew' => 180,
    'debug' => [
        'saml' => false,
        'backtraces' => true,
        'validatexml' => false,
    ],
    'showerrors' => true,
    'errorreporting' => true,
    'logging.level' => SimpleSAML\Logger::NOTICE,
    'logging.handler' => 'file',
    'logging.facility' => defined('LOG_LOCAL5') ? constant('LOG_LOCAL5') : LOG_USER,

    'logging.processname' => 'simplesamlphp',
    'logging.logfile' => 'simplesamlphp.log',
    'enable.saml20-idp' => true,
    'enable.shib13-idp' => false,
    'enable.adfs-idp' => false,
    'shib13.signresponse' => true,

    'session.duration' => 8 * (60 * 60), // 8 hours.
    'session.datastore.timeout' => (4 * 60 * 60), // 4 hours
    'session.state.timeout' => (60 * 60), // 1 hour
    'session.cookie.name' => 'SimpleSAMLSessionID',
    'session.cookie.lifetime' => 0,
    'session.cookie.path' => '/',
    'session.cookie.domain' => null,
    'session.cookie.secure' => true,
    'session.cookie.samesite' => null,
    'session.phpsession.cookiename' => 'SimpleSAML',
    'session.phpsession.savepath' => null,
    'session.phpsession.httponly' => true,
    'session.authtoken.cookiename' => 'SimpleSAMLAuthToken',
    'session.rememberme.enable' => false,
    'session.rememberme.checked' => false,
    'session.rememberme.lifetime' => (14 * 86400),
    'memcache_store.servers' => [ [ ['hostname' => 'localhost'], ], ],
    'memcache_store.prefix' => '',
    'memcache_store.expires' => 36 * (60 * 60), // 36 hours.
    'language' => [
        'priorities' => [
            'no' => ['nb', 'nn', 'en', 'se'],
            'nb' => ['no', 'nn', 'en', 'se'],
            'nn' => ['no', 'nb', 'en', 'se'],
            'se' => ['nb', 'no', 'nn', 'en'],
            'nr' => ['zu', 'en'],
            'nd' => ['zu', 'en'],
        ],
    ],

    'language.available' => [
        'en', 'no', 'nn', 'se', 'da', 'de', 'sv', 'fi', 'es', 'ca', 'fr', 'it', 'nl', 'lb',
        'cs', 'sl', 'lt', 'hr', 'hu', 'pl', 'pt', 'pt-br', 'tr', 'ja', 'zh', 'zh-tw', 'ru',
        'et', 'he', 'id', 'sr', 'lv', 'ro', 'eu', 'el', 'af', 'zu', 'xh',
    ],
    'language.rtl' => ['ar', 'dv', 'fa', 'ur', 'he'],
    'language.default' => 'en',
    'language.parameter.name' => 'language',
    'language.parameter.setcookie' => true,
    'language.cookie.name' => 'language',
    'language.cookie.domain' => null,
    'language.cookie.path' => '/',
    'language.cookie.secure' => false,
    'language.cookie.httponly' => false,
    'language.cookie.lifetime' => (60 * 60 * 24 * 900),
    'language.cookie.samesite' => null,

    'theme.use' => 'default',
    'template.auto_reload' => false,
    'production' => false,
    'assets' => [
        'caching' => [
            'max_age' => 86400,
            'etag' => false,
        ],
    ],

    'idpdisco.enableremember' => true,
    'idpdisco.rememberchecked' => true,
    'idpdisco.validate' => false,
    'idpdisco.extDiscoveryStorage' => null,
    'idpdisco.layout' => 'dropdown',

    'authproc.idp' => [
        30 => 'core:LanguageAdaptor',
        45 => [
            'class'         => 'core:StatisticsWithAttribute',
            'attributename' => 'realm',
            'type'          => 'saml20-idp-SSO',
        ],
        50 => 'core:AttributeLimit',
        99 => 'core:LanguageAdaptor',
    ],

    'authproc.sp' => [
        90 => 'core:LanguageAdaptor',
    ],

    /**************************
     | METADATA CONFIGURATION |
     **************************/

    'metadatadir' => 'metadata',
    'metadata.sources' => [
        ['type' => 'flatfile'],
    ],

    'metadata.sign.enable' => false,
    'metadata.sign.privatekey' => null,
    'metadata.sign.privatekey_pass' => null,
    'metadata.sign.certificate' => null,
    'metadata.sign.algorithm' => null,

    # 'store.type'                    => 'phpsession',
    'store.type' => 'sql',
    'store.sql.dsn' => 'mysql:host=mariadb;dbname=simplesaml',
    'store.sql.username' => 'simplesaml',
    'store.sql.password' => 'simplesaml',

    /****************************
     | OIDC module requirements |
     ***************************/
    'database.dsn' => 'mysql:host=mariadb;dbname=simplesaml',
    'database.username' => 'simplesaml',
    'database.password' => 'simplesaml',
    'language.i18n.backend' => 'gettext/gettext',
];
