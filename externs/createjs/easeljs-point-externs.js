/**
 * @fileoverview Externs for easeljs
 * @externs
 */

/**
 * @constructor
 * @param {number=} x
 * @param {number=} y
 */
createjs.Point = function(x, y) {};

/**
 * @type {number}
 */
createjs.Point.prototype.x;

/**
 * @type {number}
 */
createjs.Point.prototype.y;

/**
 * @return {createjs.Point}
 */
createjs.Point.clone = function() {};

/**
 * @return {createjs.Point}
 */
createjs.Point.copy = function() {};

/**
 * @param {number=} x
 * @param {number=} y
 * @return {createjs.Point}
 */
createjs.Point.initialize = function(x, y) {};

/**
 * @return {string}
 */
createjs.Point.toString = function() {};