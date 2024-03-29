{**
 * templates/frontend/objects/article_details.tpl
 *
 * UPDATED/CHANGED/MODIFIED: Tao You @vanderbilt - 2020.05.08
 * Customized artile details page for Vanderbilt Lives journal
 * 
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of an Article which displays all details about the article.
 *  Expected to be primary object on the page.
 *
 * @uses $article Article This article
 * @uses $issue Issue The issue this article is assigned to
 * @uses $section Section The journal section this article is assigned to
 * @uses $keywords array List of keywords assigned to this article
 * @uses $citationFactory @todo
 * @uses $pubIdPlugins @todo
 *}
 <!-- customized artile detail page for Vanderbilt Lives --> 
<article class="article-details">

	{* Notification that this is an old version *}
	{if $currentPublication->getId() !== $publication->getId()}
		<div class="alert alert-warning" role="alert">
			{capture assign="latestVersionUrl"}{url page="article" op="view" path=$article->getBestId()}{/capture}
			{translate key="submission.outdatedVersion"
				datePublished=$publication->getData('datePublished')|date_format:$dateFormatShort
				urlRecentVersion=$latestVersionUrl|escape
			}
		</div>
	{/if}

	<header>
		<h1 class="page-header">
			{$publication->getLocalizedTitle()|escape}
			{if $publication->getLocalizedData('subtitle')}
				<small>
					{$publication->getLocalizedData('subtitle')|escape}
				</small>
			{/if}
		</h1>
	</header>

	{** removed sidebar, re-arrange everything in one main div **}
	<section class="article-main"> 
		{* Screen-reader heading for easier navigation jumps *}
		<h2 class="sr-only">{translate key="plugins.themes.bootstrap3.article.main"}</h2>

		{** list of authors **}
		{if $publication->getData('authors')}
			<div class="authors">
				{foreach from=$publication->getData('authors') item=author}
					<div class="author">
						<strong>{$author->getFullName()|escape}</strong>
						{if $author->getLocalizedAffiliation()}
							<div class="article-author-affilitation">
								{$author->getLocalizedAffiliation()|escape}
							</div>
						{/if}
						{if $author->getOrcid()}
							<div class="orcid">
								{$orcidIcon}
								<a href="{$author->getOrcid()|escape}" target="_blank">
									{$author->getOrcid()|escape}
								</a>
							</div>
						{/if}
					</div>
				{/foreach}
			</div>
		{/if}


		{* Article Galleys *}
		{if $primaryGalleys || $supplementaryGalleys}
			<div class="download">
				{if $primaryGalleys}
					{foreach from=$primaryGalleys item=galley}
						{include file="frontend/objects/galley_link.tpl" parent=$article purchaseFee=$currentJournal->getSetting('purchaseArticleFee') purchaseCurrency=$currentJournal->getSetting('currency')}
					{/foreach}
				{/if}
				{if $supplementaryGalleys}
					{foreach from=$supplementaryGalleys item=galley}
						{include file="frontend/objects/galley_link.tpl" parent=$article isSupplementary="1"}
					{/foreach}
				{/if}
			</div>
		{/if}

		{* DOI (requires plugin) *}
		{foreach from=$pubIdPlugins item=pubIdPlugin}
			{if $pubIdPlugin->getPubIdType() != 'doi'}
				{continue}
			{/if}
			{if $issue->getPublished()}
				{assign var=pubId value=$article->getStoredPubId($pubIdPlugin->getPubIdType())}
			{else}
				{assign var=pubId value=$pubIdPlugin->getPubId($article)}{* Preview pubId *}
			{/if}
			{if $pubId}
				{assign var="doiUrl" value=$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
				<div class="list-group-item doi">
					{capture assign=translatedDoi}{translate key="plugins.pubIds.doi.readerDisplayName"}{/capture}
					<strong>{translate key="semicolon" label=$translatedDoi}</strong>
					<a href="{$doiUrl}">
						{$doiUrl}
					</a>
				</div>
			{/if}
		{/foreach}


		{* Article abstract *}
		{if $publication->getLocalizedData('abstract')}
			<div class="article-summary" id="summary">
				<h2>{translate key="article.abstract"}</h2>
				<div class="article-abstract">
					{$publication->getLocalizedData('abstract')|strip_unsafe_html|nl2br}
				</div>
			</div>
		{/if}

		{call_hook name="Templates::Article::Main"}

	</section><!-- .article-main -->

	<section class="article-more-details">

		{* Screen-reader heading for easier navigation jumps *}
		<h2 class="sr-only">{translate key="plugins.themes.bootstrap3.article.details"}</h2>
	
		{if $citation}
		<div class="panel panel-default how-to-cite">
			<div class="panel-heading">
				{translate key="submission.howToCite"}
			</div>
			<div class="panel-body">
				<div id="citationOutput" role="region" aria-live="polite">
					{$citation}
				</div>
				<div class="btn-group">
				  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-controls="cslCitationFormats">
				    {translate key="submission.howToCite.citationFormats"}
						<span class="caret"></span>
				  </button>
				  <ul class="dropdown-menu" role="menu">
						{foreach from=$citationStyles item="citationStyle"}
							<li>
								<a
									aria-controls="citationOutput"
									href="{url page="citationstylelanguage" op="get" path=$citationStyle.id params=$citationArgs}"
									data-load-citation
									data-json-href="{url page="citationstylelanguage" op="get" path=$citationStyle.id params=$citationArgsJson}"
								>
									{$citationStyle.title|escape}
								</a>
							</li>
						{/foreach}
				  </ul>
				</div>
			</div>
		</div>
		{/if}
		 
		{* PubIds (requires plugins) *}
		{foreach from=$pubIdPlugins item=pubIdPlugin}
			{if $pubIdPlugin->getPubIdType() == 'doi'}
				{continue}
			{/if}
			{if $issue->getPublished()}
				{assign var=pubId value=$article->getStoredPubId($pubIdPlugin->getPubIdType())}
			{else}
				{assign var=pubId value=$pubIdPlugin->getPubId($article)}{* Preview pubId *}
			{/if}
			{if $pubId}
				<div class="panel panel-default pub_ids">
					<div class="panel-heading">
						{$pubIdPlugin->getPubIdDisplayType()|escape}
					</div>
					<div class="panel-body">
						{if $pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
							<a id="pub-id::{$pubIdPlugin->getPubIdType()|escape}" href="{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}">
								{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
							</a>
						{else}
							{$pubId|escape}
						{/if}
					</div>
				</div>
			{/if}
		{/foreach}

		{* Licensing info *}
		{if $licenseTerms || $licenseUrl}
			<div class="panel panel-default copyright">
				<div class="panel-body">
					{if $licenseUrl}
						{if $ccLicenseBadge}
							{$ccLicenseBadge}
						{else}
							<a href="{$licenseUrl|escape}" class="copyright">
								{if $copyrightHolder}
									{translate key="submission.copyrightStatement" copyrightHolder=$copyrightHolder copyrightYear=$copyrightYear}
								{else}
									{translate key="submission.license"}
								{/if}
							</a>
						{/if}
					{/if}
					{$licenseTerms}
				</div>
			</div>
		{/if}

		{* Author biographies *}
		{assign var="hasBiographies" value=0}
		{foreach from=$publication->getData('authors') item=author}
			{if $author->getLocalizedBiography()}
				{assign var="hasBiographies" value=$hasBiographies+1}
			{/if}
		{/foreach}
		{if $hasBiographies}
			<div class="panel panel-default author-bios">
				<div class="panel-heading">
					{if $hasBiographies > 1}
						{translate key="submission.authorBiographies"}
					{else}
						{translate key="submission.authorBiography"}
					{/if}
				</div>
				<div class="panel-body">
					{foreach from=$publication->getData('authors') item=author}
						{if $author->getLocalizedBiography()}
							<div class="media biography">
								<div class="media-body">
									<h3 class="media-heading biography-author">
										{if $author->getLocalizedAffiliation()}
											{capture assign="authorName"}{$author->getFullName()|escape}{/capture}
											{capture assign="authorAffiliation"}<span class="affiliation">{$author->getLocalizedAffiliation()|escape}</span>{/capture}
											{translate key="submission.authorWithAffiliation" name=$authorName affiliation=$authorAffiliation}
										{else}
											{$author->getFullName()|escape}
										{/if}
									</h3>
									{$author->getLocalizedBiography()|strip_unsafe_html}
								</div>
							</div>
						{/if}
					{/foreach}
				</div>
			</div>
		{/if}

		{call_hook name="Templates::Article::Details"}

		{* References *}
		{if $parsedCitations || $publication->getData('citationsRaw')}
			<div class="article-references">
				<h2>{translate key="submission.citations"}</h2>
				<div class="article-references-content">
					{if $parsedCitations}
						{foreach from=$parsedCitations item="parsedCitation"}
							<p>{$parsedCitation->getCitationWithLinks()|strip_unsafe_html} {call_hook name="Templates::Article::Details::Reference" citation=$parsedCitation}</p>
						{/foreach}
					{else}
						{$publication->getData('citationsRaw')|nl2br}
					{/if}
				</div>
			</div>
		{/if}

	</section><!-- .article-details -->
	
</article>
