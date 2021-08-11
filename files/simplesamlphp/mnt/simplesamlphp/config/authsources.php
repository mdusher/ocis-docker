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
			'uid' => 'einstein',
			'mail' => 'einstein@example.org',
			'eduPersonAffiliation' => array('member'),
			'cn' => array('Albert Einstein'),
			'groups' => ['Users'],
		],
		'marie:radioactivity' => [
			'uid' => 'marie',
			'mail' => 'marie@example.org',
			'eduPersonAffiliation' => array('member'),
			'cn' => array('Marie Curie'),
			'groups' => ['Users'],
		],
	],
);
