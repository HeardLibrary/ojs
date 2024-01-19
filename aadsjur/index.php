<?php

/**
 * @defgroup plugins_themes_aadsjur theme plugin
 */
 
/**
 * @file plugins/themes/aadsjur/index.php
 *
 * Copyright (c) 2019 Vanderbilt University Library
 * Copyright (c) 2019 Tao You 
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @ingroup plugins_themes_aadsjur
 * @brief Wrapper for default theme plugin.
 *
 */

require_once('aadsjurThemePlugin.inc.php');

return new aadsjurThemePlugin();

?>