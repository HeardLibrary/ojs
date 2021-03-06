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

  <!-- <li class="dropdown">
    <a href="{url router=$smarty.const.ROUTE_PAGE page="about"}" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">{translate key="navigation.about"} <span class="caret"></span></a>
    <ul class="dropdown-menu">
      <li>
        <a href="{url router=$smarty.const.ROUTE_PAGE page="about"}">
          {translate key="about.aboutContext"}
        </a>
      </li>
      <li>
        <a href="{url router=$smarty.const.ROUTE_PAGE page="about" op="editorialTeam"}">
          {translate key="about.editorialTeam"}
        </a>
      </li>
      <li>
        <a href="{url router=$smarty.const.ROUTE_PAGE page="about" op="submissions"}">
          {translate key="about.submissions"}
        </a>
      </li>
  	  {if $currentJournal->getSetting('mailingAddress') || $currentJournal->getSetting('contactName')}
  	  <li>
  	    <a href="{url router=$smarty.const.ROUTE_PAGE page="about" op="contact"}">
  		    {translate key="about.contact"}
  	    </a>
  	  </li>
      {/if}
    </ul>
  </li>   -->

  <li>
    <a href="{url router=$smarty.const.ROUTE_PAGE page="about"}">
      About
    </a>
  </li>
    
  <li class="dropdown">
    <a href="publish" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> Authors <span class="caret"></span></a>
    <ul class="dropdown-menu">
      <li><a href="/index.php/VanderbiltLives/information/authors"> Information For Authors</a></li>
      <li><a href="/index.php/VanderbiltLives/immersion"> Immersion Opportunities</a></li>
      <li><a href="/index.php/VanderbiltLives/information/librarians"> Resources</a></li>
      <li><a href="/index.php/VanderbiltLives/about/submissions"> Submit</a></li>
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
