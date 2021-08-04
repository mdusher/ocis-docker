<?php

$metadataurl_base = "https://" . getenv('SSP_HOST');

$metadata[$metadataurl_base . '/simplesaml/module.php/saml/sp/metadata.php/default-sp'] = [
    'AssertionConsumerService' => $metadataurl_base . '/simplesaml/module.php/saml/sp/saml2-acs.php/default-sp',
    'SingleLogoutService' => $metadataurl_base . '/simplesaml/module.php/saml/sp/saml2-logout.php/default-sp',
];
