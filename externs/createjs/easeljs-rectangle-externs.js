/**
 * @fileoverview Externs for easeljs
 * @externs
 */

/**
 * @constructor
 * @param {number=} x
 * @param {number=} y
 * @param {number=} width
 * @param {number=} height
 */
createjs.Rectangle = function(x, y, width, height) {};

/**
 * @type {number}
 */
createjs.Rectangle.prototype.height;

/**
 * @type {number}
 */
createjs.Rectangle.prototype.width;

/**
 * @type {number}
 */
createjs.Rectangle.prototype.x;

/**
 * @type {number}
 */
createjs.Rectangle.prototype.y;

/**
 * @return {createjs.Rectangle}
 */
createjs.Rectangle.prototype.clone = function() {};

/**
 * @return {createjs.Rectangle}
 */
createjs.Rectangle.prototype.copy = function() {};

/**
 * @param {number=} x
 * @param {number=} y
 * @param {number=} width
 * @param {number=} height
 * @return {createjs.Rectangle}
 */
createjs.Rectangle.prototype.initialize = function(x, y, width, height) {};

/**
 * @return {string}
 */
createjs.Rectangle.prototype.toString = function() {};