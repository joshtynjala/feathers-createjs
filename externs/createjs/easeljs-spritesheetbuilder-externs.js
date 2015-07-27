/**
 * @fileoverview Externs for easeljs
 * @externs
 */

/**
 * @constructor
 * @extends {createjs.EventDispatcher}
 */
createjs.SpriteSheetBuilder = function() {};

/**
 * @type {number}
 */
createjs.SpriteSheetBuilder.prototype.maxHeight;

/**
 * @type {number}
 */
createjs.SpriteSheetBuilder.prototype.maxWidth;

/**
 * @deprecated Listen to 'complete' event
 * @type {Function}
 */
createjs.SpriteSheetBuilder.prototype.onComplete;

/**
 * @deprecated Listen to 'progress' event
 * @type {Function}
 */
createjs.SpriteSheetBuilder.prototype.onProgress;

/**
 * @type {number}
 */
createjs.SpriteSheetBuilder.prototype.padding;

/**
 * @type {number}
 */
createjs.SpriteSheetBuilder.prototype.progress;

/**
 * @type {number}
 */
createjs.SpriteSheetBuilder.prototype.scale;

/**
 * @type {createjs.SpriteSheet}
 */
createjs.SpriteSheetBuilder.prototype.spriteSheet;

/**
 * @type {number}
 */
createjs.SpriteSheetBuilder.prototype.timeSlice;

/**
 * @param {string} name
 * @param {Array} frames
 * @param {string=} next
 * @param {number=} frequency
 * @return {createjs.SpriteSheetBuilder}
 */
createjs.SpriteSheetBuilder.prototype.addAnimation = function(name, frames, next, frequency) {};

/**
 * @param {createjs.DisplayObject} source
 * @param {createjs.Rectangle=} sourceRect
 * @param {number=} scale
 * @param {Function=} setupFunction
 * @param {Array=} setupParams
 * @param {Object=} setupScope
 * @return {number}
 */
createjs.SpriteSheetBuilder.prototype.addFrame = function(source, sourceRect, scale, setupFunction, setupParams, setupScope) {};

/**
 * @param {createjs.MovieClip} source
 * @param {createjs.Rectangle=} sourceRect
 * @param {number=} scale
 */
createjs.SpriteSheetBuilder.prototype.addMovieClip = function(source, sourceRect, scale) {};

/**
 * @return {createjs.SpriteSheet}
 */
createjs.SpriteSheetBuilder.prototype.build = function() {};

/**
 * @param {number=} timeSlice
 */
createjs.SpriteSheetBuilder.prototype.buildAsync = function(timeSlice) {};

/**
 * @return {createjs.SpriteSheetBuilder}
 */
createjs.SpriteSheetBuilder.prototype.clone = function() {};

/**
 *
 */
createjs.SpriteSheetBuilder.prototype.stopAsync = function() {};
