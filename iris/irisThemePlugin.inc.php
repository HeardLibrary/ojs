<?php

/**
 * @file plugins/themes/AmeriQuests/irisThemePlugin.inc.php
 *
 * Copyright (c) 2018-2020 Vanderbilt University Library
 * Copyright (c) 2018-2020 Tao You 
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 
 * @class irisThemePlugin
 * @ingroup plugins_themes_iris
 *
 * @brief Default theme
 */
import('lib.pkp.classes.plugins.ThemePlugin');

class irisThemePlugin extends ThemePlugin {
	/**
	 * Initialize the theme's styles, scripts and hooks. This is only run for
	 * the currently active theme.
	 *
	 * @return null
	 */
	public function init() {

		$this->setParent('defaultthemeplugin');

		// Add custom styles
		//$this->addStyle('iris', array('addLess' => array('styles/iris.less')));
	}	
		
	/**
	 * Get the display name of this plugin
	 * @return string
	 */
	function getDisplayName() {
		return __('plugins.themes.iris.name');
	}

	/**
	 * Get the description of this plugin
	 * @return string
	 */
	function getDescription() {
		return __('plugins.themes.iris.description');
	}

}