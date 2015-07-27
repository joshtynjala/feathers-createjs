/**
 * @fileoverview Externs for soundjs
 * @externs
 */

/**
 * @constructor
 */
createjs.HTMLAudioPlugin = function() {};

/**
 * @type {string}
 */
createjs.HTMLAudioPlugin.AUDIO_ENDED;

/**
 * @type {string}
 */
createjs.HTMLAudioPlugin.AUDIO_ERROR;

/**
 * @type {string}
 */
createjs.HTMLAudioPlugin.AUDIO_READY;

/**
 * @type {string}
 */
createjs.HTMLAudioPlugin.AUDIO_SEEKED;

/**
 * @type {string}
 */
createjs.HTMLAudioPlugin.AUDIO_STALLED;

/**
 * @type {number}
 */
createjs.HTMLAudioPlugin.prototype.defaultNumChannels;

/**
 * @type {boolean}
 */
createjs.HTMLAudioPlugin.prototype.enableIOS;

/**
 * @type {number}
 */
createjs.HTMLAudioPlugin.MAX_INSTANCES;

/**
 * @param {string} src
 * @return {createjs.SoundInstance}
 */
createjs.HTMLAudioPlugin.prototype.create = function(src) {};

/**
 * @param {string} src
 * @return {boolean}
 */
createjs.HTMLAudioPlugin.prototype.isPreloadStarted = function(src) {};

/**
 * @return {boolean}
 */
createjs.HTMLAudioPlugin.isSupported = function() {};

/**
 * @param {string} src
 * @param {Object} instance
 * @param {string} basePath
 */
createjs.HTMLAudioPlugin.prototype.preload = function(src, instance, basePath) {};

/**
 * @param {string} src
 * @param {number} instances
 * @return {Object}
 */
createjs.HTMLAudioPlugin.prototype.register = function(src, instances) {};

/**
 * @param {string} src
 */
createjs.HTMLAudioPlugin.prototype.removeAllSounds = function(src) {};

/**
 * @param {string} src
 */
createjs.HTMLAudioPlugin.prototype.removeSound = function(src) {};