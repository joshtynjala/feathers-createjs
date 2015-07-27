/**
 * @fileoverview Externs for easeljs
 * @externs
 */

/**
 * @constructor
 */
createjs.Touch = function() {};

/**
 * @param {createjs.Stage} stage
 */
createjs.Touch.disable = function(stage) {};

/**
 * @param {createjs.Stage} stage
 * @param {boolean=} singleTouch
 * @param {boolean=} allowDefault
 */
createjs.Touch.enable = function(stage, singleTouch, allowDefault) {};

/**
 * @return {boolean}
 */
createjs.Touch.isSupported = function() {};