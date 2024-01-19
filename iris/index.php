<?php

/**
 * @defgroup plugins_themes_iris theme plugin
 */
 
/**
 * @file plugins/themes/iris/index.php
 *
 * Copyright (c) 2018 Vanderbilt University Library
 * Copyright (c) 2018 Tao You 
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @ingroup plugins_themes_iris
 * @brief Wrapper for default theme plugin.
 *
 */

require_once('irisThemePlugin.inc.php');

return new irisThemePlugin();

?>