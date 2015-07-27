/**
 * @fileoverview Externs for easeljs
 * @externs
 */

/**
 * @constructor
 */
createjs.Filter = function() {};

/**
 * @param {CanvasRenderingContext2D} ctx
 * @param {number} x
 * @param {number} y
 * @param {number} width
 * @param {number} height
 * @param {CanvasRenderingContext2D=} targetCtx
 * @param {number=} targetX
 * @param {number=} targetY
 */
createjs.Filter.prototype.applyFilter = function(ctx, x, y, width, height, targetCtx, targetX, targetY) {};

/**
 * @return {createjs.Filter}
 */
createjs.Filter.prototype.clone = function() {};

/**
 * @return {createjs.Rectangle}
 */
createjs.Filter.prototype.getBounds = function() {};

/**
 * @return {string}
 */
createjs.Filter.prototype.toString = function() {};