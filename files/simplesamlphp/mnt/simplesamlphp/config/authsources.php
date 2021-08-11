<?php
$config = array(
	'admin' => array(
		'core:AdminPassword',
	),
	'default-sp' => array(
		'saml:SP',
		'entityID' => null,
		'idp' => null,
		'discoURL' => null,
		'ForceAuthn' => true,
	 ),
	 'devidp' => [
		'exampleauth:UserPass',
		'einstein:relativity' => [
			'eduPersonUniqueId' => 'a419f1d1-eeca-4dfd-a0cf-204d204fdb26',
			'uid' => 'einstein',
			'mail' => 'einstein@example.org',
			'eduPersonAffiliation' => array('member'),
			'cn' => array('Albert Einstein'),
			'groups' => ['Users'],
		],
		'marie:radioactivity' => [
			'eduPersonUniqueId' => '3ea845bd-e2fe-40ba-a510-4d48df6ca4dd',
			'uid' => 'marie',
			'mail' => 'marie@example.org',
			'eduPersonAffiliation' => array('member'),
			'cn' => array('Marie Curie'),
			'groups' => ['Users'],
		],
	],
);
