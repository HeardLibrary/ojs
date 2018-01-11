{**
 * templates/frontend/objects/article_summary.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of an Article summary which is shown within a list of articles.
 *
 * @uses $article Article The article
 * @uses $hasAccess bool Can this user access galleys for this context? The
 *       context may be an issue or an article
 * @uses $showGalleyLinks bool Show galley links to users without access?
 *}
{assign var=articlePath value=$article->getBestArticleId($currentJournal)}
{if (!$section.hideAuthor && $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_DEFAULT) || $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_SHOW}
	{assign var="showAuthor" value=true}
{/if}

<div class="article-summary media">
	{if $article->getLocalizedCoverImage()}
		<div class="cover media-left">
			<a href="{url page="article" op="view" path=$articlePath}" class="file">
				<img class="media-object" src="{$article->getLocalizedCoverImageUrl()|escape}">
			</a>
		</div>
	{/if}

	<div class="media-body">
		<div class="media-heading authors"> <!-- display authors  -->
			{$article->getAuthorString()}
		</div>	

		<!-- display article title : subtitle --> 
		<a href="{url page="article" op="view" path=$articlePath} ">
			{$article->getLocalizedTitle()|strip_unsafe_html}

			{if $article->getLocalizedSubtitle() }
			: {$article->getLocalizedSubtitle()|strip_unsafe_html} 
			{/if}	
		</a>
		
		<!-- display links to Abstract, PDF, and supplements --> 
		<div class="links">
			{foreach from=$article->getGalleys() item=galley}
				{include file="frontend/objects/galley_link.tpl" parent=$article} |
			{/foreach} 
			<!-- Abstract | Fulltext PDF | Supplemntal   -->
		</div>
		
	</div>

	{call_hook name="Templates::Issue::Issue::Article"}
</div><!-- .article-summary -->
