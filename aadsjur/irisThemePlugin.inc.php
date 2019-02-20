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

class aadsjurThemePlugin extends ThemePlugin {
	/**
	 * Initialize the theme's styles, scripts and hooks. This is only run for
	 * the currently active theme.
	 *
	 * @return null
	 */
	public function init() {

		$this->setParent('defaultthemeplugin');

				// Register theme options
		$this->addOption('typography', 'radio', array(
			'label' => 'plugins.themes.default.option.typography.label',
			'description' => 'plugins.themes.default.option.typography.description',
			'options' => array(
				'notoSans' => 'plugins.themes.default.option.typography.notoSans',
				'notoSerif' => 'plugins.themes.default.option.typography.notoSerif',
				'notoSerif_notoSans' => 'plugins.themes.default.option.typography.notoSerif_notoSans',
				'notoSans_notoSerif' => 'plugins.themes.default.option.typography.notoSans_notoSerif',
				'lato' => 'plugins.themes.default.option.typography.lato',
				'lora' => 'plugins.themes.default.option.typography.lora',
				'lora_openSans' => 'plugins.themes.default.option.typography.lora_openSans',
			)
		));

		$this->addOption('baseColour', 'colour', array(
			'label' => 'plugins.themes.default.option.colour.label',
			'description' => 'plugins.themes.default.option.colour.description',
			'default' => '#1E6292',
		));

		// Add custom styles
		//$this->addStyle('aadsjur', array('addLess' => array('styles/aadsjur.less')));
	}	
		
	/**
	 * Get the display name of this plugin
	 * @return string
	 */
	function getDisplayName() {
		return __('plugins.themes.aadsjur.name');
	}

	/**
	 * Get the description of this plugin
	 * @return string
	 */
	function getDescription() {
		return __('plugins.themes.aadsjur.description');
	}

}


?>
