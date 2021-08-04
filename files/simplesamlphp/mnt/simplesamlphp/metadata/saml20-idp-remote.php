<?php

$metadataurl_base = "https://" . getenv('SSP_HOST');

$metadata[$metadataurl_base . '/simplesaml/saml2/idp/metadata.php'] = array (
  'name' => [ 'en' => 'DevIDP' ],
  'entityid' => $metadataurl_base . '/simplesaml/saml2/idp/metadata.php',
  'contacts' =>
  array (
  ),
  'metadata-set' => 'saml20-idp-remote',
  'SingleSignOnService' =>
  array (
    0 =>
    array (
      'Binding' => 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect',
      'Location' => $metadataurl_base . '/simplesaml/saml2/idp/SSOService.php',
    ),
  ),
  'SingleLogoutService' =>
  array (
    0 =>
    array (
      'Binding' => 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect',
      'Location' => $metadataurl_base . '/simplesaml/saml2/idp/SingleLogoutService.php',
    ),
  ),
  'ArtifactResolutionService' =>
  array (
  ),
  'NameIDFormats' =>
  array (
    0 => 'urn:oasis:names:tc:SAML:2.0:nameid-format:transient',
  ),
  'keys' =>
  array (
    0 =>
    array (
      'encryption' => false,
      'signing' => true,
      'type' => 'X509Certificate',
      'X509Certificate' => 'MIIEazCCAtOgAwIBAgIUAj1cIz/1b+d1Mzlylla/yG0mH3EwDQYJKoZIhvcNAQELBQAwRTELMAkGA1UEBhMCQVUxEzARBgNVBAgMClNvbWUtU3RhdGUxITAfBgNVBAoMGEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDAeFw0xOTEyMTkwNDA2MzdaFw0yOTEyMTgwNDA2MzdaMEUxCzAJBgNVBAYTAkFVMRMwEQYDVQQIDApTb21lLVN0YXRlMSEwHwYDVQQKDBhJbnRlcm5ldCBXaWRnaXRzIFB0eSBMdGQwggGiMA0GCSqGSIb3DQEBAQUAA4IBjwAwggGKAoIBgQC90iY9euv3PiJ4J4B0BsgDSTCXMIb4YyaEwAt1PJK9AXl0a2DTVDVybtn9RVBGjOcqdxWrcwtsYK17VHRrLBWLrXQKscx+d573YILB5xAg2pxwqRgxaK+S94f+0/Sbu5hfTtWLSkaIEq2QQ/1hzXrPHYUhvQvx+ALxbjGCjsABvtBHWdHu9KNicJsbEJt3Vu0mpvw6gD4DULxARb8qo4Z2qjveKkMSZvL0GIcvxufuj3ybxUG3TWsaoXjaHeMpqBG7jmcej6X7Eq9MTAqGD/TT33dKqjEZSRWG29NCFZVGx2ftlWEVM803nroHQNDJKN/xpxDSGvKAoUvu/98biA+6Bjt1i0uqWPDAdpQnDCbjVmXgvkgGSkIv0+vU8w/+WnwRzDwz931OIp28o9hpvz4DqPQptuMmrLVUZ8ChXqICBn3keFy8EGUHvw99IBpaCEWfQPSdnbiYC3x00+1Dm+wMUs1CSo7bb3TZHzi16jfLGykrWahsvo70Hlvr0UOv7tkCAwEAAaNTMFEwHQYDVR0OBBYEFEJiP7+xJNC006TFsnuD50pOm7OxMB8GA1UdIwQYMBaAFEJiP7+xJNC006TFsnuD50pOm7OxMA8GA1UdEwEB/wQFMAMBAf8wDQYJKoZIhvcNAQELBQADggGBAEY/TR+nTE/UUBqQ/IOPPz2UvQnQ8yW4/6pL7UWZ6QhSrdkE/QJTZApaS76ZO3eATb18f3XiUX4Fc3nDQd8Z8AtjKeVqEYDYEMdaE/eLeoSh3sWtZQufk5wm3sa9aLc3CxVZjFfVzHnQrC9F/hVXd+9szPS7bj3JB9CjYdzZUYzqsj0jOR1C5xB1a32ZyHhGHXME+GbJ4C0JzBumd4cn0oQ3vWMFXm0mZUZ1QYiLFF/lXYEarYA1iGlmEzKbQgMSex7fQFNhnHDmagyingi4rGbu5YjrlNNAnd+jsHvF+4Hv3iRZbdyE2txtLuQ1Aq3dLgvEzasLtzkGANIIFI+9HbVj5TrHUXGK0ti3wCyXXjjqdJlLh651oaVSzh2UnJmsevdTz1o8fOzE4Mu1VXWq2t0VKBns40XybFiBIuceyqAbNgkvjHVSbZ/4Rjr5wEx/lHLcCZhRUz4q2c0djMiL+0Wq9n6jz96qDrYaeNbtUswgXL7CTjnYEZO+Mkny+UzsQg==',
    ),
    1 =>
    array (
      'encryption' => true,
      'signing' => false,
      'type' => 'X509Certificate',
      'X509Certificate' => 'MIIEazCCAtOgAwIBAgIUAj1cIz/1b+d1Mzlylla/yG0mH3EwDQYJKoZIhvcNAQELBQAwRTELMAkGA1UEBhMCQVUxEzARBgNVBAgMClNvbWUtU3RhdGUxITAfBgNVBAoMGEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDAeFw0xOTEyMTkwNDA2MzdaFw0yOTEyMTgwNDA2MzdaMEUxCzAJBgNVBAYTAkFVMRMwEQYDVQQIDApTb21lLVN0YXRlMSEwHwYDVQQKDBhJbnRlcm5ldCBXaWRnaXRzIFB0eSBMdGQwggGiMA0GCSqGSIb3DQEBAQUAA4IBjwAwggGKAoIBgQC90iY9euv3PiJ4J4B0BsgDSTCXMIb4YyaEwAt1PJK9AXl0a2DTVDVybtn9RVBGjOcqdxWrcwtsYK17VHRrLBWLrXQKscx+d573YILB5xAg2pxwqRgxaK+S94f+0/Sbu5hfTtWLSkaIEq2QQ/1hzXrPHYUhvQvx+ALxbjGCjsABvtBHWdHu9KNicJsbEJt3Vu0mpvw6gD4DULxARb8qo4Z2qjveKkMSZvL0GIcvxufuj3ybxUG3TWsaoXjaHeMpqBG7jmcej6X7Eq9MTAqGD/TT33dKqjEZSRWG29NCFZVGx2ftlWEVM803nroHQNDJKN/xpxDSGvKAoUvu/98biA+6Bjt1i0uqWPDAdpQnDCbjVmXgvkgGSkIv0+vU8w/+WnwRzDwz931OIp28o9hpvz4DqPQptuMmrLVUZ8ChXqICBn3keFy8EGUHvw99IBpaCEWfQPSdnbiYC3x00+1Dm+wMUs1CSo7bb3TZHzi16jfLGykrWahsvo70Hlvr0UOv7tkCAwEAAaNTMFEwHQYDVR0OBBYEFEJiP7+xJNC006TFsnuD50pOm7OxMB8GA1UdIwQYMBaAFEJiP7+xJNC006TFsnuD50pOm7OxMA8GA1UdEwEB/wQFMAMBAf8wDQYJKoZIhvcNAQELBQADggGBAEY/TR+nTE/UUBqQ/IOPPz2UvQnQ8yW4/6pL7UWZ6QhSrdkE/QJTZApaS76ZO3eATb18f3XiUX4Fc3nDQd8Z8AtjKeVqEYDYEMdaE/eLeoSh3sWtZQufk5wm3sa9aLc3CxVZjFfVzHnQrC9F/hVXd+9szPS7bj3JB9CjYdzZUYzqsj0jOR1C5xB1a32ZyHhGHXME+GbJ4C0JzBumd4cn0oQ3vWMFXm0mZUZ1QYiLFF/lXYEarYA1iGlmEzKbQgMSex7fQFNhnHDmagyingi4rGbu5YjrlNNAnd+jsHvF+4Hv3iRZbdyE2txtLuQ1Aq3dLgvEzasLtzkGANIIFI+9HbVj5TrHUXGK0ti3wCyXXjjqdJlLh651oaVSzh2UnJmsevdTz1o8fOzE4Mu1VXWq2t0VKBns40XybFiBIuceyqAbNgkvjHVSbZ/4Rjr5wEx/lHLcCZhRUz4q2c0djMiL+0Wq9n6jz96qDrYaeNbtUswgXL7CTjnYEZO+Mkny+UzsQg==',
    ),
  ),
);
