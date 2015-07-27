/**
 * @fileoverview Externs for easeljs
 * @externs
 */

/**
 * @constructor
 * @extends {createjs.Filter}
 * @param {number=} redMultiplier
 * @param {number=} greenMultiplier
 * @param {number=} blueMultiplier
 * @param {number=} alphaMultiplier
 * @param {number=} redOffset
 * @param {number=} greenOffset
 * @param {number=} blueOffset
 * @param {number=} alphaOffset
 */
createjs.ColorFilter = function(redMultiplier, greenMultiplier, blueMultiplier, alphaMultiplier, redOffset, greenOffset, blueOffset, alphaOffset) {};

/**
 * @type {number}
 */
createjs.ColorFilter.prototype.alphaOffset;

/**
 * @type {number}
 */
createjs.ColorFilter.prototype.blueMultiplier;

/**
 * @type {number}
 */
createjs.ColorFilter.prototype.blueOffset;

/**
 * @type {number}
 */
createjs.ColorFilter.prototype.greenMultiplier;

/**
 * @type {number}
 */
createjs.ColorFilter.prototype.greenOffset;

/**
 * @type {number}
 */
createjs.ColorFilter.prototype.redMultiplier;

/**
 * @type {number}
 */
createjs.ColorFilter.prototype.redOffset;