{**
 * templates/frontend/pages/issueArchive.tpl
 *
 * Copyright (c) 2019 Vanderbilt University Library
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display a list of recent issues.
 *
 * @uses $issues Array Collection of issues to display
 *}
 <!-- issueArchive.tpl -->
{capture assign="pageTitle"}
	{if $issues->getPageCount() > 0 && $issues->getPage() > 1}
		{translate key="archive.archivesPageNumber" pageNumber=$issues->getPage()}
	{else}
		{translate key="archive.archives"}
	{/if}
{/capture}
{include file="frontend/components/header.tpl" pageTitleTranslated=$pageTitle}

<div class="page page_issue_archive">
	{include file="frontend/components/breadcrumbs.tpl" currentTitle=$pageTitle}

	{* No issues have been published *}
	{if !$issues}
		{translate key="current.noCurrentIssueDesc"}

	{* List issues *}
	{else}
		<ul class="issues_archive">
			{iterate from=issues item=issue}
				<li>
					{include file="frontend/objects/issue_summary.tpl"}
				</li>
			{/iterate}
		</ul>

		{if $issues->getPageCount() > 0}
			<div class="cmp_pagination">
				{page_info iterator=$issues}
				{page_links anchor="issues" name="issues" iterator=$issues}
			</div>
		{/if}
	{/if}
</div>

{include file="frontend/components/footer.tpl"}
