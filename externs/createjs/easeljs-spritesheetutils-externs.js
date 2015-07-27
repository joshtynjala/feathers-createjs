/**
 * @fileoverview Externs for easeljs
 * @externs
 */

/**
 * @constructor
 */
createjs.SpriteSheetUtils = function() {};

/**
 * @deprecated Modern browsers perform better when flipping via a transform (ex. scaleX=-1) rendering this obsolete.
 * @param {createjs.SpriteSheet} spriteSheetImage
 * @param {boolean} horizontal
 * @param {boolean} vertical
 * @param {boolean} both
 */
createjs.SpriteSheetUtils.addFlippedFrames = function(spriteSheetImage, horizontal, vertical, both) {};

/**
 * @param {createjs.SpriteSheet} spriteSheet
 * @param {number|string} frameOrAnimation
 * @return {Image}
 */
createjs.SpriteSheetUtils.extractFrame = function(spriteSheet, frameOrAnimation) {};

/**
 * @deprecated Tools such as ImageAlpha generally provide better results. This will be moved to sandbox in the future.
 * @param {Image} rbgImage
 * @param {Image} alphaImage
 * @param {HTMLCanvasElement} canvas
 * @return {HTMLCanvasElement}
 */
createjs.SpriteSheetUtils.mergeAlpha = function(rbgImage, alphaImage, canvas) {};