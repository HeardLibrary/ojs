{**
 * templates/frontend/objects/galley_link.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of a galley object as a link to view or download the galley, to be used
 *  in a list of galleys.
 *
 * @uses $galley Galley
 * @uses $parent Issue|Article Object which these galleys are attached to
 * @uses $hasAccess bool Can this user access galleys for this context?
 * @uses $restrictOnlyPdf bool Is access only restricted to PDF galleys?
 * @uses $purchaseArticleEnabled bool Can this article be purchased?
 * @uses $currentJournal Journal The current journal context
 * @uses $journalOverride Journal An optional argument to override the current
 *       journal with a specific context
 *}

{* Override the $currentJournal context if desired *}
{if $journalOverride}
	{assign var="currentJournal" value=$journalOverride}
{/if}

{* Determine galley type and URL op *}
{if $galley->isPdfGalley()}
	{assign var="type" value="pdf"}
{else}
	{assign var="type" value="file"}
{/if}

{* Get page and parentId for URL *}
{if $parent instanceOf Issue}
	{assign var="page" value="issue"}
	{assign var="parentId" value=$parent->getBestIssueId()}
{else}
	{assign var="page" value="article"}
	{assign var="parentId" value=$parent->getBestArticleId()}
{/if}

{* Get user access flag *}
{if !$hasAccess}
	{if $restrictOnlyPdf && type=="pdf"}
		{assign var=restricted value="1"}
	{elseif !$restrictOnlyPdf}
		{assign var=restricted value="1"}
	{/if}
{/if}

{* Don't be frightened. This is just a link *}
<!-- <a class="galley-link btn btn-default {$type}{if $restricted} restricted{/if}" role="button" href="{url page=$page op="view" path=$parentId|to_array:$galley->getBestGalleyId($currentJournal)}"> -->
<a class="galley-link {$type}{if $restricted} restricted{/if}" role="button" href="{url page=$page op="view" path=$parentId|to_array:$galley->getBestGalleyId($currentJournal)}">
	
	{* Add some screen reader text to indicate if a galley is restricted *}
	{if $restricted}
		<span class="sr-only">
			{if $purchaseArticleEnabled}
				{translate key="reader.subscriptionOrFeeAccess"}
			{else}
				{translate key="reader.subscriptionAccess"}
			{/if}
		</span>
	{/if}

	{$galley->getGalleyLabel()|escape}
</a>