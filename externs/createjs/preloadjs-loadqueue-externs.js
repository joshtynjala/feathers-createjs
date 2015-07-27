/**
 * @fileoverview Externs for preloadjs
 * @externs
 */

/**
 * @constructor
 * @param {boolean} useXHR
 * @param {string} basePath
 * @extends {createjs.AbstractLoader}
 */
createjs.LoadQueue = function(useXHR, basePath) {};

/**
 * @type {string}
 */
createjs.LoadQueue.BINARY;

/**
 * @type {string}
 */
createjs.LoadQueue.CSS;

/**
 * @type {string}
 */
createjs.LoadQueue.IMAGE;

/**
 * @type {string}
 */
createjs.LoadQueue.JAVASCRIPT;

/**
 * @type {string}
 */
createjs.LoadQueue.JSON;

/**
 * @type {string}
 */
createjs.LoadQueue.JSONP;

/**
 * @type {number}
 */
createjs.LoadQueue.LOAD_TIMEOUT;

/**
 * @type {boolean}
 */
createjs.LoadQueue.prototype.maintainScriptOrder;

/**
 * @type {createjs.LoadQueue}
 */
createjs.LoadQueue.prototype.next;

/**
 * @deprecated Listen to 'fileload' event
 * @type {Function}
 */
createjs.LoadQueue.prototype.onFileLoad;

/**
 * @deprecated Listen to 'fileprogress' event
 * @type {Function}
 */
createjs.LoadQueue.prototype.onFileProgress;

/**
 * @type {string}
 */
createjs.LoadQueue.SOUND;

/**
 * @type {boolean}
 */
createjs.LoadQueue.prototype.stopOnError;

/**
 * @type {string}
 */
createjs.LoadQueue.SVG;

/**
 * @type {string}
 */
createjs.LoadQueue.TEXT;

/**
 * @type {boolean}
 */
createjs.LoadQueue.prototype.useXHR;

/**
 * @type {string}
 */
createjs.LoadQueue.XML;

/**
 * @param {string} value
 * @return {Object}
 */
createjs.LoadQueue.prototype.getItem  = function(value) {};

/**
 * @param {string} value
 * @param {boolean=} rawResult
 * @return {Object}
 */
createjs.LoadQueue.prototype.getResult = function(value, rawResult) {};

/**
 * @param {Function} plugin
 */
createjs.LoadQueue.prototype.installPlugin = function(plugin) {};

/**
 * @param {Object|string} file
 * @param {boolean=} loadNow
 * @param {string=} basePath
 */
createjs.LoadQueue.prototype.loadFile = function(file, loadNow, basePath) {};

/**
 * @param {Array} manifest
 * @param {boolean=} loadNow
 * @param {string=} basePath
 */
createjs.LoadQueue.prototype.loadManifest = function(manifest, loadNow, basePath) {};

/**
 * @param {string|Array} idsOrUrls
 */
createjs.LoadQueue.prototype.remove = function(idsOrUrls) {};

/**
 * 
 */
createjs.LoadQueue.prototype.removeAll = function() {};

/**
 * 
 */
createjs.LoadQueue.prototype.reset = function() {};

/**
 * @param {number} value
 */
createjs.LoadQueue.prototype.setMaxConnections = function(value) {};

/**
 * @param {boolean} value
 */
createjs.LoadQueue.prototype.setPaused = function(value) {};

/**
 * @param {boolean} value
 * @return {boolean}
 */
createjs.LoadQueue.prototype.setUseXHR = function(value) {};