/**
 * @fileoverview Externs for soundjs
 * @externs
 */

/**
 * @constructor
 * @extends {createjs.EventDispatcher}
 */
createjs.Sound = function() {};

/**
 * @type {Object}
 */
createjs.Sound.activePlugin;

/**
 * @type {string}
 */
createjs.Sound.defaultInterruptBehavior;

/**
 * @type {string}
 */
createjs.Sound.DELIMITER;

/**
 * @type {Object}
 */
createjs.Sound.EXTENSION_MAP;

/**
 * @type {string}
 */
createjs.Sound.INTERRUPT_ANY;

/**
 * @type {string}
 */
createjs.Sound.INTERRUPT_EARLY;

/**
 * @type {string}
 */
createjs.Sound.INTERRUPT_LATE;

/**
 * @type {string}
 */
createjs.Sound.INTERRUPT_NONE;

/**
 * @deprecated Listen to 'fileload' event
 * @type {Function}
 */
createjs.Sound.onLoadComplete;

/**
 * @type {string}
 */
createjs.Sound.PLAY_FAILED;

/**
 * @type {string}
 */
createjs.Sound.PLAY_FINISHED;

/**
 * @type {string}
 */
createjs.Sound.PLAY_INITED;

/**
 * @type {string}
 */
createjs.Sound.PLAY_INTERRUPTED;

/**
 * @type {string}
 */
createjs.Sound.PLAY_SUCCEEDED;

/**
 * @type {Array.<string>}
 */
createjs.Sound.SUPPORTED_EXTENSIONS;

/**
 * @param {string} src
 * @return {createjs.SoundInstance}
 */
createjs.Sound.createInstance = function(src) {};

/**
 * @return {Object}
 */
createjs.Sound.getCapabilities = function() {};

/**
 * @param {string} key
 * @return {number|boolean}
 */
createjs.Sound.getCapability = function(key) {};

/**
 * @return {boolean}
 */
createjs.Sound.getMute = function() {};

/**
 * @return {number}
 */
createjs.Sound.getVolume = function() {};

/**
 * @return {boolean}
 */
createjs.Sound.initializeDefaultPlugins = function() {};

/**
 * @param {string} src
 * @return {boolean}
 */
createjs.Sound.loadComplete = function(src) {};

/**
 * @deprecated Use setMute instead.
 * @param {boolean} value
 */
createjs.Sound.mute = function(value) {};

/**
 * @param {string} src
 * @param {string|Object=} interrupt
 * @param {number=} delay
 * @param {number=} offset
 * @param {number=} loop
 * @param {number=} volume
 * @param {number=} pan
 * @return {createjs.SoundInstance}
 */
createjs.Sound.play = function(src, interrupt, delay, offset, loop, volume, pan) {};

/**
 * @param {Array} manifest
 * @param {string} basePath
 * @return {Object}
 */
createjs.Sound.registerManifest = function(manifest, basePath) {};

/**
 * @param {Object} plugin
 * @return {boolean}
 */
createjs.Sound.registerPlugin = function(plugin) {};

/**
 * @param {Array} plugins
 * @return {boolean}
 */
createjs.Sound.registerPlugins = function(plugins) {};

/**
 * @param {string|Object} src
 * @param {string=} id
 * @param {number|Object=} data
 * @param {boolean=} preload
 * @param {string=} basePath
 * @return {Object}
 */
createjs.Sound.registerSound = function(src, id, data, preload, basePath) {};

/**
 * 
 */
createjs.Sound.removeAllSounds = function() {};

/**
 * @param {Array} manifest
 * @return {Object}
 */
createjs.Sound.removeManifest = function(manifest) {};

/**
 * @param {string|Object} src
 * @return {boolean}
 */
createjs.Sound.removeSound = function(src) {};

/**
 * @param {boolean} value
 * @return {boolean}
 */
createjs.Sound.setMute = function(value) {};

/**
 * @param {number} value
 */
createjs.Sound.setVolume = function(value) {};

/**
 * 
 */
createjs.Sound.stop = function() {};