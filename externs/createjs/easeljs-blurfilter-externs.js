/**
 * @fileoverview Externs for easeljs
 * @externs
 */

/**
 * @constructor
 * @extends {createjs.Filter}
 * @param {number=} blurX
 * @param {number=} blurY
 * @param {number=} quality
 */
createjs.BlurFilter = function(blurX, blurY, quality) {};

/**
 * @type {number}
 */
createjs.BlurFilter.prototype.blurX;

/**
 * @type {number}
 */
createjs.BlurFilter.prototype.blurY;

/**
 * @type {number}
 */
createjs.BlurFilter.prototype.quality;