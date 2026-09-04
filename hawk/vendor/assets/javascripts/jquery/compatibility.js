// Compatibility helpers removed in jQuery 4 and still used by Hawk's legacy
// third-party plugins. Keep this loaded immediately after jQuery itself.
;(function($) {
  'use strict';

  var classToType = {};

  $.each('Boolean Number String Function Array Date RegExp Object Error Symbol'.split(' '), function(_, name) {
    classToType['[object ' + name + ']'] = name.toLowerCase();
  });

  $.camelCase = function(value) {
    return String(value)
      .replace(/^-ms-/, 'ms-')
      .replace(/-([a-z])/g, function(_, letter) {
        return letter.toUpperCase();
      });
  };

  $.isArray = Array.isArray;

  $.isFunction = function(value) {
    return typeof value === 'function';
  };

  $.type = function(value) {
    if (value == null) {
      return String(value);
    }
    return typeof value === 'object' || typeof value === 'function'
      ? classToType[Object.prototype.toString.call(value)] || 'object'
      : typeof value;
  };

  $.isNumeric = function(value) {
    var type = $.type(value);
    return (type === 'number' || type === 'string') && !isNaN(value - parseFloat(value));
  };

  $.trim = function(value) {
    return value == null ? '' : String(value).trim();
  };
}(jQuery));
