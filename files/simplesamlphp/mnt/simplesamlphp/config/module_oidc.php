<?php

$config = [
    'authCodeDuration' => 'PT10M', // 10 minutes
    'refreshTokenDuration' => 'P1M', // 1 month
    'accessTokenDuration' => 'PT1H', // 1 hour,
    'pkce' => true,
    'cron_tag' => 'hourly',
    'auth' => 'default-sp',
    'useridattr' => 'mail',
    'scopes' => [],
    'translate' => [
        'sub' => ['mail'],
        'name' => ['cn'],
        'preferred_username' => ['mail'],
        'email' => ['mail'],
    ],
];

