/**
 * @fileoverview Externs for tweenjs
 * @externs
 */

/**
 * @constructor
 * @extends {createjs.EventDispatcher}
 * @param {Object} target
 * @param {Object=} props
 * @param {Object=} pluginData
 */
createjs.Tween = function(target, props, pluginData) {};

/**
 * @type {number}
 */
createjs.Tween.prototype.duration;

/**
 * @type {Object}
 */
createjs.Tween.IGNORE;

/**
 * @type {boolean}
 */
createjs.Tween.prototype.ignoreGlobalPause;

/**
 * @type {number}
 */
createjs.Tween.LOOP;

/**
 * @type {boolean}
 */
createjs.Tween.prototype.loop;

/**
 * @type {number}
 */
createjs.Tween.NONE;

/**
 * @deprecated Listen to 'change' event
 * @type {Function}
 */
createjs.Tween.prototype.onChange;

/**
 * @type {boolean}
 */
createjs.Tween.prototype.passive;

/**
 * @type {Object}
 */
createjs.Tween.prototype.pluginData;

/**
 * @type {Object}
 */
createjs.Tween.prototype.position;

/**
 * @type {number}
 */
createjs.Tween.REVERSE;

/**
 * @type {Object}
 */
createjs.Tween.prototype.target;

/**
 * @param {Function} callback
 * @param {Array} params
 * @param {Object} scope
 * @return {createjs.Tween}
 */
createjs.Tween.prototype.call = function(callback, params, scope) {};

/**
 * @param {Object} target
 * @param {Object=} props
 * @param {Object=} pluginData
 * @param {boolean=} override
 * @return {createjs.Tween}
 */
createjs.Tween.get = function(target, props, pluginData, override) {};

/**
 * @param {Object=} target
 * @return {boolean}
 */
createjs.Tween.hasActiveTweens = function(target) {};

/**
 * @param {Object} plugin
 * @param {Array} properties
 */
createjs.Tween.installPlugin = function(plugin, properties) {};


/**
 * @param {createjs.Tween} tween
 * @return {createjs.Tween}
 */
createjs.Tween.prototype.pause = function(tween) {};

/**
 * @param {createjs.Tween} tween
 * @return {createjs.Tween}
 */
createjs.Tween.prototype.play = function(tween) {};

/**
 * 
 */
createjs.Tween.removeAllTweens = function() {};

/**
 * @param {Object} target
 */
createjs.Tween.removeTweens = function(target) {};

/**
 * @param {Object} props
 * @param {Object} target
 * @return {createjs.Tween}
 */
createjs.Tween.prototype.set = function(props, target) {};

/**
 * @param {boolean} value
 * @return {createjs.Tween}
 */
createjs.Tween.prototype.setPaused = function(value) {};

/**
 * @param {number} value
 * @param {number} actionsMode
 * @return {boolean}
 */
createjs.Tween.prototype.setPosition = function(value, actionsMode) {};

/**
 * @param {number} delta
 */
createjs.Tween.prototype.tick = function(delta) {};

/**
 * @param {number} delta
 * @param {boolean} paused
 */
createjs.Tween.tick = function(delta, paused) {};

/**
 * @param {Object} props
 * @param {number=} duration
 * @param {Function=} ease
 * @return {createjs.Tween}
 */
createjs.Tween.prototype.to = function(props, duration, ease) {};

/**
 * @param {number} duration
 * @param {boolean} passive
 * @return {createjs.Tween}
 */
createjs.Tween.prototype.wait = function(duration, passive) {};