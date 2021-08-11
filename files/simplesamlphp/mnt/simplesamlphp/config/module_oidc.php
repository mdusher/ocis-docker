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
        'sub' => ['eduPersonUniqueId'],
        'name' => ['cn', 'displayName', 'mail'],
        'preferred_username' => ['uid'], // oCIS doesn't seem to like @ in URLs for the group request, so use the uid
        'email' => ['mail'],
        'groups' => ['groups'],
    ],
    'alwaysAddClaimsToIdToken' => true,
];
