/**
 * @fileoverview Externs for easeljs
 * @externs
 */

/**
 * @constructor
 * @extends {createjs.DisplayObject}
 * @param {Image|HTMLCanvasElement|HTMLVideoElement|string} imageOrUri
 */
createjs.Bitmap = function (imageOrUri) {};

/**
 * @type {Image|HTMLCanvasElement|HTMLVideoElement}
 */
createjs.Bitmap.prototype.image;

/**
 * @type {createjs.Rectangle}
 */
createjs.Bitmap.prototype.sourceRect;