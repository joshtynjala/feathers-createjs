/**
 * @fileoverview Externs for easeljs
 * @externs
 */

/**
 * @constructor
 * @extends {createjs.Container}
 * @param {string=} mode
 * @param {number=} startPosition
 * @param {boolean=} loop
 * @param {Object=} labels
 */
createjs.MovieClip = function(mode, startPosition, loop, labels) {};

/**
 * @type {boolean}
 */
createjs.MovieClip.prototype.actionsEnabled;

/**
 * @type {boolean}
 */
createjs.MovieClip.prototype.autoReset;

/**
 * @type {string}
 */
createjs.MovieClip.buildDate;

/**
 * @type {number}
 */
createjs.MovieClip.prototype.currentFrame;

/**
 * @type {Array}
 */
createjs.MovieClip.prototype.frameBounds;

/**
 * @type {string}
 */
createjs.MovieClip.INDEPENDENT;

/**
 * @type {boolean}
 */
createjs.MovieClip.prototype.loop;

/**
 * @type {string}
 */
createjs.MovieClip.prototype.mode;

/**
 * @type {boolean}
 */
createjs.MovieClip.prototype.paused;

/**
 * @type {string}
 */
createjs.MovieClip.SINGLE_FRAME;

/**
 * @type {number}
 */
createjs.MovieClip.prototype.startPosition;

/**
 * @type {string}
 */
createjs.MovieClip.SYNCHED;

/**
 * @type {createjs.Timeline}
 */
createjs.MovieClip.prototype.timeline;

/**
 * @type {string}
 */
createjs.MovieClip.version;

/**
 * @return {string}
 */
createjs.MovieClip.prototype.getCurrentLabel = function() {};

/**
 * @return {Array.<Object>}
 */
createjs.MovieClip.prototype.getLabels = function() {};

/**
 * @param {string|number} positionOrLabel
 */
createjs.MovieClip.prototype.gotoAndPlay = function(positionOrLabel) {};

/**
 * @param {string|number} positionOrLabel
 */
createjs.MovieClip.prototype.gotoAndStop = function(positionOrLabel) {};

/**
 * 
 */
createjs.MovieClip.prototype.play = function() {};

/**
 * 
 */
createjs.MovieClip.prototype.stop = function() {};