/**
 * @fileoverview Externs for soundjs
 * @externs
 */

/**
 * @constructor
 */
createjs.FlashPlugin = function() {};

/**
 * @type {string}
 */
createjs.FlashPlugin.BASE_PATH;

/**
 * @type {string}
 */
createjs.FlashPlugin.buildDate;

/**
 * @type {Object}
 */
createjs.FlashPlugin.capabilities;

/**
 * @type {boolean}
 */
createjs.FlashPlugin.prototype.flashReady;

/**
 * @type {boolean}
 */
createjs.FlashPlugin.prototype.showOutput;

/**
 * @type {string}
 */
createjs.FlashPlugin.version;

/**
 * @param {string} src
 * @return {createjs.SoundInstance}
 */
createjs.FlashPlugin.prototype.create = function(src) {};

/**
 * @param {string} data
 */
createjs.FlashPlugin.prototype.flashLog = function(data) {};

/**
 * @return {number}
 */
createjs.FlashPlugin.prototype.getVolume = function(data) {};

/**
 * @param {string} error
 */
createjs.FlashPlugin.prototype.handleErrorEvent = function(error) {};

/**
 * @param {string} method 
 */
createjs.FlashPlugin.prototype.handleEvent = function(method) {};

/**
 * @param {string} flashId
 * @param {string} method
 */
createjs.FlashPlugin.prototype.handlePreloadEvent = function(flashId, method) {};

/**
 * @param {string} flashId
 * @param {string} method
 */
createjs.FlashPlugin.prototype.handleSoundEvent = function(flashId, method) {};

/**
 * @param {boolean} src
 * @return {boolean}
 */
createjs.FlashPlugin.prototype.isPreloadStarted = function(src) {};

/**
 * @return {boolean}
 */
createjs.FlashPlugin.prototype.isSupported = function() {};

/**
 * @param {string} src
 * @param {Object} instance
 * @param {string} basePath
 */
createjs.FlashPlugin.prototype.preload = function(src, instance, basePath) {};

/**
 * @param {string} src
 * @param {number} instances
 * @return {Object}
 */
createjs.FlashPlugin.prototype.register = function(src, instances) {};

/**
 * @param {string} flashId
 * @param {Object} instance
 */
createjs.FlashPlugin.prototype.registerPreloadInstance = function(flashId, instance) {};

/**
 * @param {string} flashId
 * @param {Object} instance
 */
createjs.FlashPlugin.prototype.registerSoundInstance = function(flashId, instance) {};

/**
 * @param {string} src
 */
createjs.FlashPlugin.prototype.removeAllSounds = function(src) {};

/**
 * @param {string} src
 */
createjs.FlashPlugin.prototype.removeSound = function(src) {};

/**
 * @param {boolean} value
 * @return {boolean}
 */
createjs.FlashPlugin.prototype.setMute = function(value) {};

/**
 * @param {number} value
 * @return {boolean}
 */
createjs.FlashPlugin.prototype.setVolume = function(value) {};

/**
 * @param {string} flashId
 */
createjs.FlashPlugin.prototype.unregisterPreloadInstance = function(flashId) {};

/**
 * @param {string} flashId
 * @param {Object} instance
 */
createjs.FlashPlugin.prototype.unregisterSoundInstance = function(flashId, instance) {};