/**
 * @fileoverview Externs for easeljs
 * @externs
 */

/**
 * @constructor
 * @param {Object} data
 * @extends {createjs.EventDispatcher}
 */
createjs.SpriteSheet = function(data) {};

/**
 * @type {boolean}
 */
createjs.SpriteSheet.prototype.complete;

/**
 * @type {number}
 */
createjs.SpriteSheet.prototype.framerate;

/**
 * @deprecated Listen to 'complete' event
 * @type {Function}
 */
createjs.SpriteSheet.prototype.onComplete;

/**
 * @return {createjs.SpriteSheet}
 */
createjs.SpriteSheet.prototype.clone = function() {};

/**
 * @param {string} name
 * @return {Object}
 */
createjs.SpriteSheet.prototype.getAnimation = function(name) {};

/**
 * @return {Array}
 */
createjs.SpriteSheet.prototype.getAnimations = function() {};

/**
 * @param {number} frameIndex
 * @return {Object}
 */
createjs.SpriteSheet.prototype.getFrame = function(frameIndex) {};

/**
 * @param {number} frameIndex
 * @param {createjs.Rectangle=} rectangle
 * @return {createjs.Rectangle}
 */
createjs.SpriteSheet.prototype.getFrameBounds = function(frameIndex, rectangle) {};

/**
 * @param {string} animation
 * @return {number}
 */
createjs.SpriteSheet.prototype.getNumFrames = function(animation) {};

/**
 * @param {Object} data
 */
createjs.SpriteSheet.prototype.initialize = function(data) {};