/**
 * @fileoverview Externs for easeljs
 * @externs
 */

/**
 * @constructor
 * @extends {createjs.Filter}
 * @param {Image|HTMLCanvasElement} alphaMap
 */
createjs.AlphaMapFilter = function (alphaMap) {};

/**
 * @type {Image|HTMLCanvasElement}
 */
createjs.AlphaMapFilter.prototype.alphaMap;