/**
 * @fileoverview Externs for easeljs
 * @externs
 */

/**
 * @constructor
 * @extends {createjs.DisplayObject}
 * @param {createjs.SpriteSheet} spriteSheet
 * @param {string|number} frameOrAnimation
 */
createjs.Sprite = function(spriteSheet, frameOrAnimation) {};

/**
 * @type {string}
 */
createjs.Sprite.prototype.currentAnimation;

/**
 * @type {number}
 */
createjs.Sprite.prototype.currentAnimationFrame;

/**
 * @type {number}
 */
createjs.Sprite.prototype.currentFrame;

/**
 * @type {number}
 */
createjs.Sprite.prototype.framerate;

/**
 * @deprecated Not applicable to the new timing model in v0.7.0 and higher.
 * @type {number}
 */
createjs.Sprite.prototype.offset;

/**
 * @deprecated Listen to 'animationend' event
 * @type {Function}
 */
createjs.Sprite.prototype.onAnimationEnd;

/**
 * @type {boolean}
 */
createjs.Sprite.prototype.paused;

/**
 * @type {createjs.SpriteSheet}
 */
createjs.Sprite.prototype.spriteSheet;

/**
 * @param {number=} time
 */
createjs.Sprite.prototype.advance = function(time) {};

/**
 * @param {string|number} frameOrAnimation
 */
createjs.Sprite.prototype.gotoAndPlay = function(frameOrAnimation) {};

/**
 * @param {string|number} frameOrAnimation
 */
createjs.Sprite.prototype.gotoAndStop = function(frameOrAnimation) {};

/**
 * 
 */
createjs.Sprite.prototype.play = function() {};

/**
 * 
 */
createjs.Sprite.prototype.stop = function() {};