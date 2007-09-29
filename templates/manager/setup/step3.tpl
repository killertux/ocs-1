{**
 * step3.tpl
 *
 * Copyright (c) 2000-2007 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Step 3 of conference setup.
 *
 * $Id$
 *}
{assign var="pageTitle" value="manager.setup.layout.title"}
{include file="manager/setup/setupHeader.tpl"}

<form name="setupForm" method="post" action="{url op="saveSetup" path="3"}" enctype="multipart/form-data">
{include file="common/formErrors.tpl"}

{if count($formLocales) > 1}
<table width="100%" class="data">
	<tr valign="top">
		<td width="20%" class="label">{fieldLabel name="formLocale" key="form.formLanguage"}</td>
		<td width="80%" class="value">
			{url|assign:"setupFormUrl" op="setup" path="3"}
			{form_language_chooser form="setupForm" url=$setupFormUrl}
			<span class="instruct">{translate key="form.formLanguage.description"}</span>
		</td>
	</tr>
</table>
{/if}

<h3>3.1 {translate key="manager.setup.layout.homepageHeader"}</h3>

<p>{translate key="manager.setup.layout.homepageHeader.description"}</p>

<h4>{translate key="manager.setup.layout.conferenceTitle"}</h4>

<table width="100%" class="data">
	<tr valign="top">
		<td width="20%" class="label"><input type="radio" name="homeHeaderTitleType[{$formLocale|escape}]" id="homeHeaderTitleType-0" value="0"{if not $homeHeaderTitleType[$formLocale]} checked="checked"{/if} /> {fieldLabel name="homeHeaderTitleType-0" key="manager.setup.layout.useTextTitle"}</td>
		<td width="80%" class="value"><input type="text" name="homeHeaderTitle[{$formLocale|escape}]" value="{$homeHeaderTitle[$formLocale]|escape}" size="40" maxlength="255" class="textField" /></td>
	</tr>
	<tr valign="top">
		<td width="20%" class="label"><input type="radio" name="homeHeaderTitleType[{$formLocale|escape}]" id="homeHeaderTitleType-1" value="1"{if $homeHeaderTitleType[$formLocale]} checked="checked"{/if} /> {fieldLabel name="homeHeaderTitleType-1" key="manager.setup.layout.useImageTitle"}</td>
		<td width="80%" class="value"><input type="file" name="homeHeaderTitleImage" class="uploadField" /> <input type="submit" name="uploadHomeHeaderTitleImage" value="{translate key="common.upload"}" class="button" /></td>
	</tr>
</table>

{if $homeHeaderTitleImage[$formLocale]}
{translate key="common.fileName"}: {$homeHeaderTitleImage[$formLocale].name|escape} {$homeHeaderTitleImage[$formLocale].dateUploaded|date_format:$datetimeFormatShort} <input type="submit" name="deleteHomeHeaderTitleImage" value="{translate key="common.delete"}" class="button" />
<br />
<img src="{$publicConferenceFilesDir}/{$homeHeaderTitleImage[$formLocale].uploadName|escape}" width="{$homeHeaderTitleImage[$formLocale].width|escape}" height="{$homeHeaderTitleImage[$formLocale].height|escape}" style="border: 0;" alt="" />
{/if}

<h4>{translate key="manager.setup.layout.conferenceLogo"}</h4>

<table width="100%" class="data">
	<tr valign="top">
		<td width="20%" class="label">{translate key="manager.setup.layout.useImageLogo"}</td>
		<td width="80%" class="value"><input type="file" name="homeHeaderLogoImage" class="uploadField" /> <input type="submit" name="uploadHomeHeaderLogoImage" value="{translate key="common.upload"}" class="button" /></td>
	</tr>
</table>

{if $homeHeaderLogoImage}
{translate key="common.fileName"}: {$homeHeaderLogoImage[$formLocale].name|escape} {$homeHeaderLogoImage.dateUploaded|date_format:$datetimeFormatShort} <input type="submit" name="deleteHomeHeaderLogoImage" value="{translate key="common.delete"}" class="button" />
<br />
<img src="{$publicConferenceFilesDir}/{$homeHeaderLogoImage[$formLocale].uploadName|escape}" width="{$homeHeaderLogoImage[$formLocale].width|escape}" height="{$homeHeaderLogoImage[$formLocale].height|escape}" style="border: 0;" alt="" />
{/if}

<div class="separator"></div>

<h3>3.2 {translate key="manager.setup.layout.conferencePageHeader"}</h3>

<p>{translate key="manager.setup.layout.conferencePageHeader.description"}</p>

<h4>{translate key="manager.setup.layout.conferenceLogo"}</h4>

<table width="100%" class="data">
	<tr valign="top">
		<td width="20%" class="label"><input type="radio" name="pageHeaderTitleType[{$formLocale|escape}]" id="pageHeaderTitleType-0" value="0"{if not $pageHeaderTitleType[$formLocale]} checked="checked"{/if} /> {fieldLabel name="pageHeaderTitleType-0" key="manager.setup.layout.useTextTitle"}</td>
		<td width="80%" class="value"><input type="text" name="pageHeaderTitle[{$formLocale|escape}]" value="{$pageHeaderTitle[$formLocale]|escape}" size="40" maxlength="255" class="textField" /></td>
	</tr>
	<tr valign="top">
		<td width="20%" class="label"><input type="radio" name="pageHeaderTitleType[{$formLocale|escape}]" id="pageHeaderTitleType-1" value="1"{if $pageHeaderTitleType[$formLocale]} checked="checked"{/if} /> {fieldLabel name="pageHeaderTitleType-1" key="manager.setup.layout.useImageTitle"}</td>
		<td width="80%" class="value"><input type="file" name="pageHeaderTitleImage" class="uploadField" /> <input type="submit" name="uploadPageHeaderTitleImage" value="{translate key="common.upload"}" class="button" /></td>
	</tr>
</table>

{if $pageHeaderTitleImage[$formLocale]}
{translate key="common.fileName"}: {$pageHeaderTitleImage[$formLocale].name|escape} {$pageHeaderTitleImage[$formLocale].dateUploaded|date_format:$datetimeFormatShort} <input type="submit" name="deletePageHeaderTitleImage" value="{translate key="common.delete"}" class="button" />
<br />
<img src="{$publicConferenceFilesDir}/{$pageHeaderTitleImage[$formLocale].uploadName|escape}" width="{$pageHeaderTitleImage[$formLocale].width|escape}" height="{$pageHeaderTitleImage[$formLocale].height|escape}" style="border: 0;" alt="" />
{/if}

<h4>{translate key="manager.setup.layout.conferenceLogo"}</h4>

<table width="100%" class="data">
	<tr valign="top">
		<td width="20%" class="label">{translate key="manager.setup.layout.useImageLogo"}</td>
		<td width="80%" class="value"><input type="file" name="pageHeaderLogoImage" class="uploadField" /> <input type="submit" name="uploadPageHeaderLogoImage" value="{translate key="common.upload"}" class="button" /></td>
	</tr>
</table>

{if $pageHeaderLogoImage[$formLocale]}
{translate key="common.fileName"}: {$pageHeaderLogoImage[$formLocale].name|escape} {$pageHeaderLogoImage[$formLocale].dateUploaded|date_format:$datetimeFormatShort} <input type="submit" name="deletePageHeaderLogoImage" value="{translate key="common.delete"}" class="button" />
<br />
<img src="{$publicConferenceFilesDir}/{$pageHeaderLogoImage[$formLocale].uploadName|escape}" width="{$pageHeaderLogoImage[$formLocale].width|escape}" height="{$pageHeaderLogoImage[$formLocale].height|escape}" style="border: 0;" alt="" />
{/if}

<h4>{translate key="manager.setup.layout.alternateHeader"}</h4>

<p>{translate key="manager.setup.layout.alternateHeaderDescription"}</p>

<p><textarea name="conferencePageHeader[{$formLocale|escape}]" id="conferencePageHeader" rows="10" cols="60" class="textArea">{$conferencePageHeader[$formLocale]|escape}</textarea></p>


<div class="separator"></div>


<h3>3.3 {translate key="manager.setup.layout.conferencePageFooter"}</h3>

<p>{translate key="manager.setup.layout.conferencePageFooterDescription"}</p>

<p><textarea name="conferencePageFooter[{$formLocale|escape}]" id="conferencePageFooter" rows="10" cols="60" class="textArea">{$conferencePageFooter[$formLocale]|escape}</textarea></p>


<div class="separator"></div>

<h3>3.4 {translate key="manager.setup.layout.lists"}</h3>

<p>{translate key="manager.setup.layout.lists.description"}</p>

<table width="100%" class="data">
	<tr valign="top">
		<td width="20%" class="label">{translate key="manager.setup.layout.itemsPerPage"}</td>
		<td width="80%" class="value"><input type="text" size="3" name="itemsPerPage" class="textField" value="{$itemsPerPage|escape}" /></td>
	</tr>
	<tr valign="top">
		<td width="20%" class="label">{translate key="manager.setup.layout.numPageLinks"}</td>
		<td width="80%" class="value"><input type="text" size="3" name="numPageLinks" class="textField" value="{$numPageLinks|escape}" /></td>
	</tr>
</table>

<div class="separator"></div>

<p><input type="submit" value="{translate key="common.saveAndContinue"}" class="button defaultButton" /> <input type="button" value="{translate key="common.cancel"}" class="button" onclick="document.location.href='{url op="setup" escape=false}'" /></p>

<p><span class="formRequired">{translate key="common.requiredField"}</span></p>

</form>

{include file="common/footer.tpl"}
