<?php

/**
 * Implements hook_install_tasks().
 */
function pinnakl_install_tasks() {
  $tasks = array();
  $tasks['pinnakl_final'] = array();
  return $tasks;
}


/**
 * Final configurations for pinnakl.
 */
function pinnakl_final() {
  variable_set('site_name', 'pinnakl');
  variable_set('site_slogan', 'pinnakl');

  global $databases;
  $plus = $databases['default']['default']['database'];
  variable_set('site_mail', 'miles.france+' . $plus . '@gmail.com');

  // Final sanity check
  module_disable(array('devel', 'dblog', 'update'));

  // Finally, enable our permissions module.
  module_enable(array('pinnakl_users'));
}
