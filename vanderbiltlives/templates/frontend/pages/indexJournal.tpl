{**
 * templates/frontend/pages/indexJournal.tpl
 *
 * UPDATED/CHANGED/MODIFIED: Marc Behiels - marc@elemental.ca - 250416
 *
 * Copyright (c) 2017 Vanderbilt University Library 
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the index page for a journal
 *
 * @uses $currentJournal Journal This journal
 * @uses $journalDescription string Journal description from HTML text editor
 * @uses $homepageImage object Image to be displayed on the homepage
 * @uses $additionalHomeContent string Arbitrary input from HTML text editor
 * @uses $announcements array List of announcements
 * @uses $numAnnouncementsHomepage int Number of announcements to display on the
 *       homepage
 * @uses $issue Issue Current issue
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

<!-- add jumbotron and carousel --> 
 <div class="jumbotron">

  <div id="carousel-example-generic" class="carousel slide">
  

  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="/public/journals/15/photo1.png" alt="picture 1" />
    </div>  
    <div class="item">
      <img src="/public/journals/15/photo2.jpg" alt="picture 2" />
    </div>
    <div class="item">
      <img src="/public/journals/15/photo3.jpg" alt="picture 3" />
    </div>
    <div class="item">
      <img src="/public/journals/15/photo4.jpg" alt="picture 4" /> 
    </div>
    <div class="item">
      <img src="/public/journals/15/photo5.png" alt="picture 5" />
    </div> 
  </div>

  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<div class="caption pull-right">Photographs by Rachel Anand</div> 

</div>

	<div id="main-content" class="page_index_journal" role="content">

	{* Additional Homepage Content *}
	{if $additionalHomeContent}
		<section class="additional_content">
			{$additionalHomeContent}
		</section>
	{/if}

	{call_hook name="Templates::Index::journal"}

	{* Latest issue *}
	{if $issue}
		<section class="current_issue">
		<!--<header class="page-header">
				<h2>
					{translate key="journal.currentIssue"}
				</h2>
			</header> -->
			<!-- <p class="current_issue_title lead">  -->
			<h3 class="page-header">
				{$issue->getIssueIdentification()|strip_unsafe_html} <span style="float: right; font-size: 75%;">{$issue->getDatePublished()|date_format:$dateFormatShort}</span>
			</h3>
			
			{include file="frontend/objects/issue_toc.tpl"}
			<a href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}" class="btn btn-primary read-more">
				{translate key="journal.viewAllIssues"}
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</section>
	{/if}


</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
