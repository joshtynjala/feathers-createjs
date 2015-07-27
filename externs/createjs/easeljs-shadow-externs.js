/**
 * @fileoverview Externs for easeljs
 * @externs
 */

/**
 * @constructor
 * @param {string} color
 * @param {number} offsetX
 * @param {number} offsetY
 * @param {number} blur
 */
createjs.Shadow = function(color, offsetX, offsetY, blur) {};

/**
 * @type {number}
 */
createjs.Shadow.prototype.blur;

/**
 * @type {string}
 */
createjs.Shadow.prototype.color;


/**
 * @type {createjs.Shadow}
 */
createjs.Shadow.identity;

/**
 * @type {number}
 */
createjs.Shadow.prototype.offsetX;

/**
 * @type {number}
 */
createjs.Shadow.prototype.offsetY;

/**
 * @return {createjs.Shadow}
 */
createjs.Shadow.prototype.clone = function() {};

/**
 * @param {string} color
 * @param {number} offsetX
 * @param {number} offsetY
 * @param {number} blur
 */
createjs.Shadow.prototype.initialize = function(color, offsetX, offsetY, blur) {};

/**
 * @return {string}
 */
createjs.Shadow.prototype.toString = function() {};