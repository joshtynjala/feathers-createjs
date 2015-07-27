/**
 * @fileoverview Externs for easeljs
 * @externs
 */

/**
 * @constructor
 * @extends {createjs.DisplayObject}
 * @param {string=} text
 * @param {createjs.SpriteSheet=} spriteSheet
 */
createjs.BitmapText = function (text, spriteSheet) {};

/**
 * @type {number}
 */
createjs.BitmapText.prototype.letterSpacing;

/**
 * @type {number}
 */
createjs.BitmapText.prototype.lineHeight;

/**
 * @type {number}
 */
createjs.BitmapText.prototype.spaceWidth;

/**
 * @type {string}
 */
createjs.BitmapText.prototype.spriteSheet;

/**
 * @type {string}
 */
createjs.BitmapText.prototype.text;