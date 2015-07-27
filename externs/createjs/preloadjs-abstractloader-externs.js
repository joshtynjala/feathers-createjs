/**
 * @fileoverview Externs for preloadjs
 * @externs
 */

/**
 * @constructor
 * @extends {createjs.EventDispatcher}
 */
createjs.AbstractLoader = function() {};


/**
 * @type {boolean}
 */
createjs.AbstractLoader.prototype.canceled;

/**
 * @type {boolean}
 */
createjs.AbstractLoader.prototype.loaded;

/**
 * @deprecated Listen to 'complete' event
 * @type {Function}
 */
createjs.AbstractLoader.prototype.onComplete;

/**
 * @deprecated Listen to 'error' event
 * @type {Function}
 */
createjs.AbstractLoader.prototype.onError;

/**
 * @deprecated Listen to 'loadstart' event
 * @type {Function}
 */
createjs.AbstractLoader.prototype.onLoadStart;

/**
 * @deprecated Listen to 'progress' event
 * @type {Function}
 */
createjs.AbstractLoader.prototype.onProgress;

/**
 * @type {number}
 */
createjs.AbstractLoader.prototype.progress;

/**
 * @param {string} src
 * @param {string=} basePath
 * @param {Object=} data
 * @return {string}
 */
createjs.AbstractLoader.prototype.buildPath = function(src, basePath, data) {};

/**
 * 
 */
createjs.AbstractLoader.prototype.close = function() {};

/**
 *
 */
createjs.AbstractLoader.prototype.load = function() {};