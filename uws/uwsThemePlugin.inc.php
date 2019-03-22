<?php

/**
 * @file plugins/themes/AmeriQuests/aadsjurThemePlugin.inc.php
 *
 * Copyright (c) 2019 Vanderbilt University Library
 * Copyright (c) 2019 Tao You 
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 
 * @class aadsjurThemePlugin
 * @ingroup plugins_themes_aadsjur
 *
 * @brief Default theme
 */
import('lib.pkp.classes.plugins.ThemePlugin');

class uwsThemePlugin extends ThemePlugin {
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
		//$this->modifyStyle('bootstrap', array('addLess' =>array('styles/variables.less'))); 
		//$this->addStyle('stem', 'styles/aadsjur.less');

		// Remove options of the parent theme.
		//if (method_exists($this, 'removeOption')) {
		//	$this->removeOption('bootstrapTheme');
		//}
	}	
		
	/**
	 * Get the display name of this plugin
	 * @return string
	 */
	function getDisplayName() {
		return __('plugins.themes.uws.name');
	}

	/**
	 * Get the description of this plugin
	 * @return string
	 */
	function getDescription() {
		return __('plugins.themes.uws.description');
	}

}


?>
