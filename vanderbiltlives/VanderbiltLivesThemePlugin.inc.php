<?php

/**
 * @file plugins/themes/default/BootstrapThree4StemThemePlugin.inc.php
 * customized theme for STEM journal based on Bootstrap3 basic theme

 *
 * @class BootstrapThree4StemThemePlugin
 * @ingroup plugins_themes_bootstrap3
 *
 * @brief Default theme
 */

import('lib.pkp.classes.plugins.ThemePlugin');
class VanderbiltLivesThemePlugin extends ThemePlugin {
	/**
	 * Initialize the theme
	 *
	 * @return null
	 */
	public function init() {

		// Initialize the parent theme
		$this->setParent('bootstrapthreethemeplugin');

		//Add child theme styles
		$this->modifyStyle('bootstrap', array('addLess' =>array('styles/variables.less'))); 
		$this->addStyle('vandylives', 'styles/vandylives.less');

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
		return __('plugins.themes.vanderbiltlives.name');
	}

	/**
	 * Get the description of this plugin
	 * @return string
	 */
	function getDescription() {
		return __('plugins.themes.vanderbiltlives.description');
	}
}
