{**
 * templates/frontend/objects/article_details.tpl
 *
 * UPDATED/CHANGED/MODIFIED: Tao You @vanderbilt - 2020.05.01
 * Customized article detail page for AmeriQuest journal at Vanderbilt
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
<!-- customized article detail page for AmeriQuest -->
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

	<div class="row">

		<section class="article-sidebar col-md-4">

			{* Screen-reader heading for easier navigation jumps *}
			<h2 class="sr-only">{translate key="plugins.themes.bootstrap3.article.sidebar"}</h2>

			{* Article/Issue cover image *}
			{if $publication->getLocalizedData('coverImage') || ($issue && $issue->getLocalizedCoverImage())}
				<div class="cover-image">
					{if $publication->getLocalizedData('coverImage')}
						{assign var="coverImage" value=$publication->getLocalizedData('coverImage')}
						<img
							class="img-responsive"
							src="{$publication->getLocalizedCoverImageUrl($article->getData('contextId'))|escape}"
							alt="{$coverImage.altText|escape|default:''}"
						>
					{else}
						<a href="{url page="issue" op="view" path=$issue->getBestIssueId()}">
							<img
								class="img-responsive"
								src="{$issue->getLocalizedCoverImageUrl()|escape}"
								alt="{$issue->getLocalizedCoverImageAltText()|escape|default:''}"
							>
						</a>
					{/if}
				</div>
			{/if}

			<div class="list-group">

				{* Published date *}
				{if $publication->getData('datePublished')}
					<div class="list-group-item date-published">
						{capture assign=translatedDatePublished}{translate key="submissions.published"}{/capture}
						<strong>{translate key="semicolon" label=$translatedDatePublished}</strong>
						{$publication->getData('datePublished')|date_format}
					</div>
					{* If this is an updated version *}
					{if $firstPublication->getID() !== $publication->getId()}
						<div class="list-group-item date-updated">
							{capture assign=translatedUpdated}{translate key="common.updated"}{/capture}
							<strong>{translate key="semicolon" label=$translatedUpdated}</strong>
							{$publication->getData('datePublished')|date_format:$dateFormatShort}
						</div>
					{/if}
					{* Versions *}
					{if count($article->getPublishedPublications()) > 1}
						<div class="list-group-item versions">
							<strong>{capture assign=translatedVersions}{translate key="submission.versions"}{/capture}
							{translate key="semicolon" label=$translatedVersions}</strong>
							{foreach from=array_reverse($article->getPublishedPublications()) item=iPublication}
								{capture assign="name"}{translate key="submission.versionIdentity" datePublished=$iPublication->getData('datePublished')|date_format:$dateFormatShort version=$iPublication->getData('version')}{/capture}
								<div>
									{if $iPublication->getId() === $publication->getId()}
										{$name}
									{elseif $iPublication->getId() === $currentPublication->getId()}
										<a href="{url page="article" op="view" path=$article->getBestId()}">{$name}</a>
									{else}
										<a href="{url page="article" op="view" path=$article->getBestId()|to_array:"version":$iPublication->getId()}">{$name}</a>
									{/if}
								</div>
							{/foreach}
						</div>
					{/if}
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

			</div>
			
			{* Issue article appears in *}
			<div class="panel panel-default issue">
				<div class="panel-heading">
					{translate key="issue.issue"}
				</div>
				<div class="panel-body">
					<a class="title" href="{url|escape page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}">
						{$issue->getIssueIdentification()|escape}
					</a>

				</div>
			</div>

			{if $section}
				<div class="panel panel-default section">
					<div class="panel-heading">
						{translate key="section.section"}
					</div>
					<div class="panel-body">
						{$section->getLocalizedTitle()|escape}
					</div>
				</div>
			{/if}
			
		</section><!-- .article-sidebar -->


		<div class="col-md-8">
			<section class="article-main">

				{* Screen-reader heading for easier navigation jumps *}
				<h2 class="sr-only">{translate key="plugins.themes.bootstrap3.article.main"}</h2>

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

				{* Article abstract *}
				{if $publication->getLocalizedData('abstract')}
					<div class="article-summary" id="summary">
						<h2>{translate key="article.abstract"}</h2>
						<div class="article-abstract">
							{$publication->getLocalizedData('abstract')|strip_unsafe_html|nl2br}
						</div>
					</div>
				{/if}

				{* References - updated to include video player *}
				{if $article->getCitations()}
					{$article->getCitations()|strip_unsafe_html|nl2br}
					<div class="item references">
						<h3>{* translate key="submission.citation" *}
						
						</h3>
							
						<video id="player_video" controls></video> 

						<script src="https://cdn.jsdelivr.net/npm/hls.js@latest" type="text/javascript"></script>  
						<script type="text/javascript"> 
						    var video = document.getElementById('player_video'); 
    						if(Hls.isSupported()) { 
      							var hls = new Hls({
      								liveSyncDuration: 30, 
      							}); 
      							hls.loadSource('https://57cfde5d5a7ad.streamlock.net:443/library/_definst_/mp4:ameriquests//4897-12-18551-1-10-20200506.m4a/playlist.m3u8'); 
      							hls.attachMedia(video); 
      							hls.on(Hls.Events.MANIFEST_PARSED,function() { 
 		       						console.log("%cHLS video loaded using hls.js v."+Hls.version, "font-weight: bold; font-size: small"); 
        							//video.play(); // to make it autoplay 
      							}); 
    						} 
    						else if (video.canPlayType('application/vnd.apple.mpegurl')) { 
      							video.src = 'https://57cfde5d5a7ad.streamlock.net:443/library/_definst_/mp4:ameriquests//4897-12-18551-1-10-20200506.m4a/playlist.m3u8'; 
      							video.addEventListener('loadedmetadata',function() { 
        							console.log("%cDASH video loaded using hls.js v."+Hls.version, "font-weight: bold; font-size: small"); 
        							// video.play(); // to make it autoplay 
      							}); 
    						} 
						</script> 

					</div>
				{/if}


				{* Keywords *}
				{if !empty($keywords[$currentLocale])}
					<div class="list-group-item keywords">
						<strong>{capture assign=translatedKeywords}{translate key="article.subject"}{/capture}
							{translate key="semicolon" label=$translatedKeywords}</strong>
						<div class="">
								<span class="value">
									{foreach from=$keywords item=keyword}
										{foreach name=keywords from=$keyword item=keywordItem}
											{$keywordItem|escape}{if !$smarty.foreach.keywords.last}, {/if}
										{/foreach}
									{/foreach}
								</span>
						</div>
					</div>
				{/if}

				{call_hook name="Templates::Article::Main"}

			</section><!-- .article-main -->

			<section class="article-more-details">

				{* Screen-reader heading for easier navigation jumps *}
				<h2 class="sr-only">{translate key="plugins.themes.bootstrap3.article.details"}</h2>

				{* How to cite *}
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

				{* Licensing info -- updated styles for AmeriQuest: using a modal activate by a button *}
				{if $licenseTerms || $licenseUrl}

					<button class="btn btn-default" type="button" data-toggle="modal" data-target="#copyrightModal"> Copyright and Licensing </button>
					<!-- Modal -->
					<div class="modal fade" id="copyrightModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					        <h4 class="modal-title" id="myModalLabel">Copyright and Licensing</h4>
					      	</div>
					      	<div class="modal-body">
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
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					      </div>
					    </div>
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

				{* References -- out of box, no longer needed }
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
				{/if  *}

			</section><!-- .article-details -->
		</div><!-- .col-md-8 -->
	</div><!-- .row -->

</article>
