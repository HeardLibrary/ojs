<?php

/**
 * @file plugins/themes/AmeriQuests/AmeriQuestsThemePlugin.inc.php
 *
 * Copyright (c) 2017 Vanderbilt University Library
 * Copyright (c) 2017 Tao You 
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 
 * @class AmeriQuestsThemePlugin
 * @ingroup plugins_themes_AmeriQuests
 *
 * @brief Default theme
 */
import('lib.pkp.classes.plugins.ThemePlugin');

class AmeriQuestsThemePlugin extends ThemePlugin {
	/**
	 * Initialize the theme's styles, scripts and hooks. This is only run for
	 * the currently active theme.
	 *
	 * @return null
	 */
	public function init() {

		// Initialize the parent theme
		$this->setParent('bootstrapthreethemeplugin');
		//Add child theme styles
		$this->modifyStyle('bootstrap', array('addLess' =>array('styles/variables.less'))); 
		$this->addStyle('ameriquests', 'styles/ameriquests.less'); 
		//print_r($this);
		
		// Remove options of the parent theme.
		if (method_exists($this, 'removeOption')) {
			$this->removeOption('bootstrapTheme');
		}
	}	
		
	/**
	 * Get the display name of this plugin
	 * @return string
	 */
	function getDisplayName() {
		return __('plugins.themes.ameriquests.name');
	}

	/**
	 * Get the description of this plugin
	 * @return string
	 */
	function getDescription() {
		return __('plugins.themes.ameriquests.description');
	}

}