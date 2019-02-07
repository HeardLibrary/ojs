<?php

/**
 * @file plugins/themes/vurj/vurjThemePlugin.inc.php
 *
 * Copyright (c) 2019 Vanderbilt University Library
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class vurjThemePlugin
 * @ingroup plugins_themes_vurj
 *
 * @ Default theme for VURJ 
 */

import('lib.pkp.classes.plugins.ThemePlugin');

class vurjThemePlugin extends ThemePlugin {
	/**
	 * Initialize the theme's styles, scripts and hooks. This is only run for
	 * the currently active theme.
	 *
	 * @return null
	 */
	public function init() {

		// Initialize the parent theme
		$this->setParent('defaultthemeplugin');
		
		//Add child theme styles
		//$this->addStyle('vurj', 'styles/vurj.less'); 
		//print_r($this);
	}	
		
	/**
	 * Get the display name of this plugin
	 * @return string
	 */
	function getDisplayName() {
		return __('plugins.themes.vurj.name');
	}

	/**
	 * Get the description of this plugin
	 * @return string
	 */
	function getDescription() {
		return __('plugins.themes.vurj.description');
	}

}

?>
