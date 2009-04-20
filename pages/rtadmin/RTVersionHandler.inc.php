<?php

/**
 * @file RTVersionHandler.inc.php
 *
 * Copyright (c) 2000-2009 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class RTVersionHandler
 * @ingroup pages_rtadmin
 *
 * @brief Handle Reading Tools administration requests -- setup section.
 */

//$Id$

import('rt.ocs.ConferenceRTAdmin');
import('pages.rtadmin.RTAdminHandler');

class RTVersionHandler extends RTAdminHandler {
	/**
	 * Constructor
	 **/
	function RTVersionHandler() {
		parent::RTAdminHandler();
	}
	
	function createVersion($args) {
		$this->validate();

		$rtDao = &DAORegistry::getDAO('RTDAO');

		$conference = Request::getConference();

		import('rt.ocs.form.VersionForm');
		// FIXME: Need construction by reference or validation always fails on PHP 4.x
		$versionForm =& new VersionForm(null, $conference->getConferenceId());

		if (isset($args[0]) && $args[0]=='save') {
			$versionForm->readInputData();
			$versionForm->execute();
			Request::redirect(null, null, null, 'versions');
		} else {
			$this->setupTemplate(true);
			$versionForm->display();
		}
	}

	function exportVersion($args) {
		$this->validate();

		$rtDao = &DAORegistry::getDAO('RTDAO');

		$conference = Request::getConference();
		$versionId = isset($args[0])?$args[0]:0;
		$version = &$rtDao->getVersion($versionId, $conference->getConferenceId());

		if ($version) {
			$templateMgr = &TemplateManager::getManager();
			$templateMgr->assign_by_ref('version', $version);

			$templateMgr->display('rtadmin/exportXml.tpl', 'application/xml');
		}
		else Request::redirect(null, null, null, 'versions');
	}

	function importVersion() {
		$this->validate();
		$conference = &Request::getConference();

		$fileField = 'versionFile';
		if (isset($_FILES[$fileField]['tmp_name']) && is_uploaded_file($_FILES[$fileField]['tmp_name'])) {
			$rtAdmin = new ConferenceRTAdmin($conference->getConferenceId());
			$rtAdmin->importVersion($_FILES[$fileField]['tmp_name']);
		}
		Request::redirect(null, null, null, 'versions');
	}

	function restoreVersions() {
		$this->validate();

		$conference = &Request::getConference();
		$rtAdmin = new ConferenceRTAdmin($conference->getConferenceId());
		$rtAdmin->restoreVersions();

		// If the conference RT was configured, change its state to
		// "disabled" because the RT version it was configured for
		// has now been deleted.
		$rtDao = &DAORegistry::getDAO('RTDAO');
		$conferenceRt = $rtDao->getConferenceRTByConference($conference);
		if ($conferenceRt) {
			$conferenceRt->setVersion(null);
			$rtDao->updateConferenceRT($conferenceRt);
		}

		Request::redirect(null, null, null, 'versions');
	}

	function versions() {
		$this->validate();
		$this->setupTemplate(true);

		$conference = Request::getConference();

		$rtDao = &DAORegistry::getDAO('RTDAO');
		$rangeInfo = Handler::getRangeInfo('versions');

		$templateMgr = &TemplateManager::getManager();
		$templateMgr->assign_by_ref('versions', $rtDao->getVersions($conference->getConferenceId(), $rangeInfo));
		$templateMgr->assign('helpTopicId', 'conference.generalManagement.readingTools.versions');
		$templateMgr->display('rtadmin/versions.tpl');
	}

	function editVersion($args) {
		$this->validate();

		$rtDao = &DAORegistry::getDAO('RTDAO');

		$conference = Request::getConference();
		$versionId = isset($args[0])?$args[0]:0;
		$version = &$rtDao->getVersion($versionId, $conference->getConferenceId());

		if (isset($version)) {
			import('rt.ocs.form.VersionForm');
			$this->setupTemplate(true, $version);
			// FIXME: Need construction by reference or validation always fails on PHP 4.x
			$versionForm =& new VersionForm($versionId, $conference->getConferenceId());
			$versionForm->initData();
			$versionForm->display();
		}
		else Request::redirect(null, null, null, 'versions');
	}

	function deleteVersion($args) {
		$this->validate();

		$rtDao = &DAORegistry::getDAO('RTDAO');

		$conference = Request::getConference();
		$versionId = isset($args[0])?$args[0]:0;

		$rtDao->deleteVersion($versionId, $conference->getConferenceId());

		Request::redirect(null, null, null, 'versions');
	}

	function saveVersion($args) {
		$this->validate();

		$rtDao = &DAORegistry::getDAO('RTDAO');

		$conference = Request::getConference();
		$versionId = isset($args[0])?$args[0]:0;
		$version = &$rtDao->getVersion($versionId, $conference->getConferenceId());

		if (isset($version)) {
			import('rt.ocs.form.VersionForm');
			// FIXME: Need construction by reference or validation always fails on PHP 4.x
			$versionForm =& new VersionForm($versionId, $conference->getConferenceId());
			$versionForm->readInputData();
			$versionForm->execute();
		}

		Request::redirect(null, null, null, 'versions');
	}
}

?>
