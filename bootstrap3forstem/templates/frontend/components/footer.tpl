{**
 * templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2017 Vanderbilt University Library
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common site frontend footer.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}

	</main>

	{* Sidebars *}
	{if empty($isFullWidth)}
		{call_hook|assign:"sidebarCode" name="Templates::Common::Sidebar"}
		{if $sidebarCode}
			<aside id="sidebar" class="pkp_structure_sidebar left col-xs-12 col-sm-2 col-md-4" role="complementary" aria-label="{translate|escape key="common.navigation.sidebar"}">

        <div class="panel panel-default">
          <div class="panel-heading"> <h3 class="panel-title">Staff </h3> </div>      
          <div class="panel-body">
            <ul class="list-group"> <b>Editors:</b>
              <li> <strong>Virginia L. Shepherd, PhD</strong>, Research Professor of Education, Director of the Center for Science Outreach, Vanderbilt University</li>
              <li> <strong>Ann Chester, PhD</strong>, Assistant VP for Education Partnerships, Director of HSTA, Director of HCOP, Deputy Director of the Center of Excellence in Women’s Health, West Virginia University </li>
            </ul>  

            <ul class="list-group"> <b>Associate Editors: </b>
              <li> <strong>Maurice Godfrey, PhD</strong>, University of Nebraska Medical Center</li>
              <li> <strong>Mike Kennedy, PhD</strong>, Northwestern University </li>
              <li> <strong>Mary Jo Koroly, PhD</strong>, University of Florida </li>
              <li> <strong>Juan Lopez-Garriga, PhD</strong>, Recinto Universitario de Mayaguez</li>
              <li> <strong>Jennifer A. Ufnar, PhD</strong>, Vanderbilt University </li>
            </ul>  
          </div>
        </div> <!-- /panel --> 


        <div class="pkp_block block_make_submission">
          <div class="content">
            <a class="btn-block block_make_submission_link" href="/index.php/JRLSO/about/submissions">
              Submit Manuscript
            </a>
          </div>
        </div>

      <!-- Start Twitter Feed-->
      <div class="well">
        <a class="twitter-timeline" href="https://twitter.com/JSTEMOutreach?ref_src=twsrc%5Etfw" data-tweet-limit="3">        Tweets by JSTEMOutreach
        </a>
          
        <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"> </script>
      </div>  
      <!-- End Twitter Feed-->

			</aside><!-- pkp_sidebar.left -->
		{/if}
	{/if}
  </div><!-- pkp_structure_content -->

  <footer class="footer" role="contentinfo">

  	<div class="container">

      <div class="row">
    		{if $pageFooter}
        <div class="col-md-8">
          {$pageFooter}
        </div>
    		{/if}

    		<div class="col-md-4" role="complementary" aria-label="{translate|escape key="about.aboutThisPublishingSystem"}">
    			<a href="{url page="about" op="aboutThisPublishingSystem"}">
    				<img alt="{translate key=$packageKey}" src="{$baseUrl}/{$brandImage}">
    			</a>
    			<a href="{$pkpLink}">
    				<img alt="{translate key="common.publicKnowledgeProject"}" src="{$baseUrl}/lib/pkp/templates/images/pkp_brand.png">
    			</a>
    		</div>

      </div> <!-- .row -->
  	</div><!-- .container -->
  </footer>
</div><!-- pkp_structure_page -->

{load_script context="frontend" scripts=$scripts}

{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>
