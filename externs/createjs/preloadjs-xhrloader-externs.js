/**
 * @fileoverview Externs for preloadjs
 * @externs
 */

/**
 * @constructor
 * @param {Object} item
 * @extends {createjs.AbstractLoader}
 */
createjs.XHRLoader = function(item) {};

/**
 * @return {string}
 */
createjs.XHRLoader.prototype.getAllResponseHeaders = function() {};

/**
 * @param {string} header
 * @return {string}
 */
createjs.XHRLoader.prototype.getResponseHeader = function(header) {};

/**
 * @param {boolean=} rawResult
 * @return {Object}
 */
createjs.XHRLoader.prototype.getResult = function(rawResult) {};