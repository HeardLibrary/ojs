{**
* templates/frontend/components/primaryNavMenu.tpl
*
* Copyright (c) 2017 Vanderbilt University Library
* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
*
* Primary navigation menu list for OJS
*}
<ul id="main-navigation" class="nav navbar-nav">
<!--
  {if $enableAnnouncements}
  <li>
    <a href="{url router=$smarty.const.ROUTE_PAGE page="announcement"}">
      {translate key="announcement.announcements"}
    </a>
  </li>
  {/if}
-->

  <li>
    <a href="{url router=$smarty.const.ROUTE_PAGE page="about"}">
      About
    </a>
  </li>
    
  <li class="dropdown">
    <a href="publish" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> Publish <span class="caret"></span></a>
    <ul class="dropdown-menu">
      <li><a href="{url router=$smarty.const.ROUTE_PAGE page="for-authors"}"> Information For Authors</a></li>
      <li><a href="{url router=$smarty.const.ROUTE_PAGE page="publish"}"> Submission Guidelines</a></li>
      <li><a href="{url router=$smarty.const.ROUTE_PAGE page="review"}"> Manuscript Review Process</a></li>
      <li><a href="{url router=$smarty.const.ROUTE_PAGE page="policies"}"> Policies</a></li>
    </ul>
  </li>


  {if $currentJournal}

    {if $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
    <li>
      <a href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="current"}">
      {translate key="navigation.current"}
      </a>
    </li>
    <li>
    <a href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}">
      {translate key="navigation.archives"}
    </a>
    </li>
    {/if} 
  {/if}

   
  </ul>
