<?php

/**
 * @defgroup pages_user
 */

/**
 * @file pages/user/index.php
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Handle requests for user functions.
 *
 * @ingroup pages_user
 */

switch ($op) {
	//
	// Profiles
	//
	case 'profile':
	case 'saveProfile':
	case 'changePassword':
	case 'savePassword':
		define('HANDLER_CLASS', 'ProfileHandler');
		import('lib.pkp.pages.user.ProfileHandler');
		break;
	//
	// Create Account
	//
	case 'register':
	case 'account':
	case 'createAccount':
	case 'activateUser':
		define('HANDLER_CLASS', 'CreateAccountHandler');
		import('pages.user.CreateAccountHandler');
		break;
	//
	// Email
	//
	case 'email':
		define('HANDLER_CLASS', 'EmailHandler');
		import('pages.user.EmailHandler');
		break;
	//
	// Misc.
	//
	case 'index':
	case 'setLocale':
	case 'getInterests':
	case 'authorizationDenied':
	case 'become':
		define('HANDLER_CLASS', 'UserHandler');
		import('pages.user.UserHandler');
		break;
}

?>
