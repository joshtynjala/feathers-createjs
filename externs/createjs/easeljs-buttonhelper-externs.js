/**
 * @fileoverview Externs for easeljs
 * @externs
 */

/**
 * @constructor
 * @param {createjs.Sprite|createjs.MovieClip} target
 * @param {string=} outLabel
 * @param {string=} overLabel
 * @param {string=} downLabel
 * @param {boolean=} play
 * @param {createjs.DisplayObject=} hitArea
 * @param {string=} hitLabel
 */
createjs.ButtonHelper = function(target, outLabel, overLabel, downLabel, play, hitArea, hitLabel) {};

/**
 * @type {string|number}
 */
createjs.ButtonHelper.prototype.downLabel;

/**
 * @type {string|number}
 */
createjs.ButtonHelper.prototype.outLabel;

/**
 * @type {string|number}
 */
createjs.ButtonHelper.prototype.overLabel;

/**
 * @type {boolean}
 */
createjs.ButtonHelper.prototype.play;

/**
 * @type {createjs.Sprite|createjs.BitmapAnimation}
 */
createjs.ButtonHelper.prototype.target;

/**
 * @param {boolean} value
 */
createjs.ButtonHelper.prototype.setEnabled = function(value) {};

/**
 * @return {string}
 */
createjs.ButtonHelper.prototype.toString = function() {};