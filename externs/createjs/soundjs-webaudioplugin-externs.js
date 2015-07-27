/**
 * @fileoverview Externs for soundjs
 * @externs
 */

/**
 * @constructor
 */
createjs.WebAudioPlugin = function() {};

/**
 * @type {Object}
 */
createjs.WebAudioPlugin.prototype.context;

/**
 * @type {Node|Element}
 */
createjs.WebAudioPlugin.prototype.dynamicsCompressorNode;

/**
 * @type {Node|Element}
 */
createjs.WebAudioPlugin.prototype.gainNode;

/**
 * @param {string} src
 * @return {boolean}
 */
createjs.WebAudioPlugin.prototype.addPreloadResults = function(src) {};

/**
 * @param {string} src
 * @return {createjs.SoundInstance}
 */
createjs.WebAudioPlugin.prototype.create = function(src) {};

/**
 * @return {number}
 */
createjs.WebAudioPlugin.prototype.getVolume = function() {};

/**
 * @param {string} src
 * @return {boolean}
 */
createjs.WebAudioPlugin.prototype.isPreloadComplete = function(src) {};

/**
 * @param {string} src
 * @return {boolean}
 */
createjs.WebAudioPlugin.prototype.isPreloadStarted = function(src) {};

/**
 * @return {boolean}
 */
createjs.WebAudioPlugin.isSupported = function() {};

/**
 * 
 */
createjs.WebAudioPlugin.prototype.playEmptySound = function() {};

/**
 * @param {string} src
 * @param {number} instances
 * @return {Object}
 */
createjs.WebAudioPlugin.prototype.register = function(src, instances) {};

/**
 * @param {string} src
 */
createjs.WebAudioPlugin.prototype.removeAllSounds = function(src) {};

/**
 * @deprecated is deprecated
 * @param {string} src
 */
createjs.WebAudioPlugin.prototype.removeFromPreload = function(src) {};

/**
 * @param {string} src
 */
createjs.WebAudioPlugin.prototype.removeSound = function(src) {};

/**
 * @param {boolean} value
 * @return {boolean}
 */
createjs.WebAudioPlugin.prototype.setMute = function(value) {};

/**
 * @param {number} value
 * @return {boolean}
 */
createjs.WebAudioPlugin.prototype.setVolume = function(value) {};