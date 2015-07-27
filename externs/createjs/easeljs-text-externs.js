/**
 * @fileoverview Externs for easeljs
 * @externs
 */

/**
 * @constructor
 * @extends {createjs.DisplayObject}
 * @param {string=} text
 * @param {string=} font
 * @param {string=} color
 */
createjs.Text = function(text, font, color) {};

/**
 * @type {string}
 */
createjs.Text.prototype.color;

/**
 * @type {string}
 */
createjs.Text.prototype.font;

/**
 * @type {number}
 */
createjs.Text.prototype.lineHeight;

/**
 * @type {number}
 */
createjs.Text.prototype.lineWidth;

/**
 * @type {number}
 */
createjs.Text.prototype.maxWidth;

/**
 * @type {number}
 */
createjs.Text.prototype.outline;

/**
 * @type {string}
 */
createjs.Text.prototype.text;

/**
 * @type {string}
 */
createjs.Text.prototype.textAlign;

/**
 * @type {string}
 */
createjs.Text.prototype.textBaseline;

/**
 * @return {number}
 */
createjs.Text.prototype.getMeasuredHeight = function() {};

/**
 * @return {number}
 */
createjs.Text.prototype.getMeasuredLineHeight = function() {};

/**
 * @return {number}
 */
createjs.Text.prototype.getMeasuredWidth = function() {};

