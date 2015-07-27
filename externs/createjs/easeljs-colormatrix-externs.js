/**
 * @fileoverview Externs for easeljs
 * @externs
 */

/**
 * @constructor
 * @extends {Array}
 * @param {number} brightness
 * @param {number} contrast
 * @param {number} saturation
 * @param {number} hue
 */
createjs.ColorMatrix = function(brightness, contrast, saturation, hue) {};

/**
 * @param {number} value
 * @return {createjs.ColorMatrix}
 */
createjs.ColorMatrix.prototype.adjustBrightness = function(value) {};

/**
 * @param {number} brightness
 * @param {number} contrast
 * @param {number} saturation
 * @param {number} hue
 * @return {createjs.ColorMatrix}
 */
createjs.ColorMatrix.prototype.adjustColor = function(brightness, contrast, saturation, hue) {};

/**
 * @param {number} value
 * @return {createjs.ColorMatrix}
 */
createjs.ColorMatrix.prototype.adjustContrast = function(value) {};

/**
 * @param {number} value
 * @return {createjs.ColorMatrix}
 */
createjs.ColorMatrix.prototype.adjustHue = function(value) {};

/**
 * @param {number} value
 * @return {createjs.ColorMatrix}
 */
createjs.ColorMatrix.prototype.adjustSaturation = function(value) {};

/**
 * @return {createjs.ColorMatrix}
 */
createjs.ColorMatrix.prototype.clone = function() {};
/**
 * @param {Array} matrix
 * @return {createjs.ColorMatrix}
 */
createjs.ColorMatrix.prototype.copyMatrix = function(matrix) {};

/**
 * @return {createjs.ColorMatrix}
 */
createjs.ColorMatrix.prototype.reset = function() {};

/**
 * @return {Array}
 */
createjs.ColorMatrix.prototype.toArray = function() {};