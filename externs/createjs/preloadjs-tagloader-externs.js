/**
 * @fileoverview Externs for preloadjs
 * @externs
 */

/**
 * @constructor
 * @param {Object} item
 * @extends {createjs.AbstractLoader}
 */
createjs.TagLoader = function(item) {};

/**
 * @type {boolean}
 */
createjs.TagLoader.prototype._isAudio;

/**
 * @return {HTMLImageElement|HTMLAudioElement|Object}
 */
createjs.TagLoader.prototype.getResult  = function() {};