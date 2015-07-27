/**
 * @fileoverview Externs for easeljs
 * @externs
 */

/**
 * @constructor
 */
createjs.Ticker = function() {};

/**
 * @type {number}
 */
createjs.Ticker.maxDelta;

/**
 * @type {string}
 */
createjs.Ticker.RAF;

/**
 * @type {string}
 */
createjs.Ticker.RAF_SYNCHED;

/**
 * @type {string}
 */
createjs.Ticker.TIMEOUT;

/**
 * @type {string}
 */
createjs.Ticker.timingMode;

/**
 * @deprecated Deprecated in favour of {{#crossLink "Ticker/timingMode"}}{{/crossLink}}.
 * @type {boolean}
 */
createjs.Ticker.useRAF;

/**
 * @param {boolean} runTime
 * @return {number}
 */
createjs.Ticker.getEventTime = function(runTime) {};

/**
 * @return {number}
 */
createjs.Ticker.getFPS = function() {};

/**
 * @return {number}
 */
createjs.Ticker.getInterval = function() {};

/**
 * @param {number=} ticks
 * @return {number}
 */
createjs.Ticker.getMeasuredFPS = function(ticks) {};

/**
 * @param {number=} ticks
 * @return {number}
 */
createjs.Ticker.getMeasuredTickTime = function(ticks) {};

/**
 * @return {boolean}
 */
createjs.Ticker.getPaused = function() {};

/**
 * @param {boolean} pauseable
 * @return {number}
 */
createjs.Ticker.getTicks = function(pauseable) {};

/**
 * @param {boolean} runTime
 * @return {number}
 */
createjs.Ticker.getTime = function(runTime) {};

/**
 *
 */
createjs.Ticker.init = function() {};

/**
 *
 */
createjs.Ticker.reset = function() {};

/**
 * @param {number} value
 */
createjs.Ticker.setFPS = function(value) {};

/**
 * @param {number} interval
 */
createjs.Ticker.setInterval = function(interval) {};

/**
 * @param {boolean} value
 */
createjs.Ticker.setPaused = function(value) {};


/**
 * @param {string} type
 * @param {Function|Object} listener
 * @param {boolean=} useCapture
 * @return {Function|Object}
 */
createjs.Ticker.addEventListener  = function(type, listener, useCapture) {};

/**
 * @param {Object|String} eventObj
 * @param {Object=} target
 * @return {boolean}
 */
createjs.Ticker.dispatchEvent = function(eventObj, target) {};

/**
 * @param {string} type
 * @return {boolean}
 */
createjs.Ticker.hasEventListener = function(type) {};

/**
 * @param {string=} type
 */
createjs.Ticker.removeAllEventListeners = function(type) {};

/**
 * @param {string} type
 * @param {Function|Object} listener
 * @param {boolean=} useCapture
 */
createjs.Ticker.removeEventListener = function(type, listener, useCapture) {};

/**
 * @return {string}
 */
createjs.Ticker.toString = function() {};

