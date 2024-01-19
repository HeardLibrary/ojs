<?php

/**
 * @file plugins/themes/homiletic/HomileticThemePlugin.inc.php
 *
 * Copyright (c) 2017 Vanderbilt University Library
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class homileticThemePlugin
 * @ingroup plugins_themes_homiletic
 *
 * @brief Default theme
 */
import('lib.pkp.classes.plugins.ThemePlugin');

class homileticThemePlugin extends ThemePlugin {
	/**
	 * Initialize the theme's styles, scripts and hooks. This is only run for
	 * the currently active theme.
	 *
	 * @return null
	 */
	public function init() {

		// Initialize the parent theme -- ManuscriptTheme, which is a child theme of default theme
		$this->setParent('defaultmanuscriptchildthemeplugin');

		//Add child theme customized styles
		// modify default styles, adding additional less before compiling 
		$this->modifyStyle('stylesheet', array('addLess' => array('../defaultManuscript/styles/index.less', 'styles/homiletic.less')));		

		//$this->addStyle('customizeStyle', 'styles/homiletic.css'); 
	}

	/**
	 * Get the display name of this plugin
	 * @return string
	 */
	function getDisplayName() {
		return __('plugins.themes.homiletic.name');
	}

	/**
	 * Get the description of this plugin
	 * @return string
	 */
	function getDescription() {
		return __('plugins.themes.homiletic.description');
	}
}

?>
