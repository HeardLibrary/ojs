<?php

/**
 * @file plugins/themes/default/DefaultManuscriptChildThemePlugin.inc.php
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

class homiletic2ThemePlugin extends ThemePlugin {
	/**
	 * Initialize the theme's styles, scripts and hooks. This is only run for
	 * the currently active theme.
	 *
	 * @return null
	 */
	public function init() {

		// Initialize the parent theme
		$this->setParent('defaultthemeplugin');

		// Add custom styles
		//$this->modifyStyle('stylesheet', array('addLess' => array('styles/index.less')));

	}

	/**
	 * Get the display name of this plugin
	 * @return string
	 */
	function getDisplayName() {
		return __('plugins.themes.homiletic2.name');
	}

	/**
	 * Get the description of this plugin
	 * @return string
	 */
	function getDescription() {
		return __('plugins.themes.homiletic2.description');
	}
}

?>

