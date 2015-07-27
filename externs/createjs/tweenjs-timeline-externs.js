/**
 * @fileoverview Externs for tweenjs
 * @externs
 */

/**
 * @constructor
 * @extends {createjs.EventDispatcher}
 * @param {Array.<createjs.Tween>} tweens
 * @param {Array.<string>} labels
 * @param {Object} props
 */
createjs.Timeline = function(tweens, labels, props) {};

/**
 * @type {number}
 */
createjs.Timeline.prototype.duration;

/**
 * @type {boolean}
 */
createjs.Timeline.prototype.ignoreGlobalPause;

/**
 * @type {boolean}
 */
createjs.Timeline.prototype.loop;

/**
 * @deprecated Listen to 'change' event
 * @type {Function}
 */
createjs.Timeline.prototype.onChange;

/**
 * @type {Object}
 */
createjs.Timeline.prototype.position;

/**
 * @param {string} label
 * @param {number} position
 */
createjs.Timeline.prototype.addLabel = function(label, position) {};

/**
 * @param {createjs.Tween} tween
 * @return {createjs.Tween}
 */
createjs.Timeline.prototype.addTween = function(tween) {};

/**
 * @return {string}
 */
createjs.Timeline.prototype.getCurrentLabel = function() {};

/**
 * @return {Array.<Object>}
 */
createjs.Timeline.prototype.getLabels = function() {};

/**
 * @param {string|number} positionOrLabel
 */
createjs.Timeline.prototype.gotoAndPlay = function(positionOrLabel) {};

/**
 * @param {string|number} positionOrLabel
 */
createjs.Timeline.prototype.gotoAndStop = function(positionOrLabel) {};

/**
 * @param {createjs.Tween} tween
 * @return {boolean}
 */
createjs.Timeline.prototype.removeTween = function(tween) {};

/**
 * @param {string|number} positionOrLabel 
 */
createjs.Timeline.prototype.resolve = function(positionOrLabel) {};

/**
 * @param {Object} o
 */
createjs.Timeline.prototype.setLabels = function(o) {};

/**
 * @param {boolean} value
 */
createjs.Timeline.prototype.setPaused = function(value) {};

/**
 * @param {number} value
 * @param {number=} actionsMode
 * @return {boolean}
 */
createjs.Timeline.prototype.setPosition = function(value, actionsMode) {};

/**
 * @param {number} delta
 */
createjs.Timeline.prototype.tick = function(delta) {};

/**
 * 
 */
createjs.Timeline.prototype.updateDuration = function() {};