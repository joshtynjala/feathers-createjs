/**
 * @fileoverview Externs for createjs
 * @externs
 */

/**
 * @constructor
 * @param {string} type
 * @param {boolean} bubbles
 * @param {boolean} cancelable
 */
createjs.Event = function(type, bubbles, cancelable) {};

/**
 * @type {boolean}
 */
createjs.Event.prototype.bubbles;

/**
 * @type {boolean}
 */
createjs.Event.prototype.cancelable;

/**
 * @type {Object}
 */
createjs.Event.prototype.currentTarget;

/**
 * @type {boolean}
 */
createjs.Event.prototype.defaultPrevented;

/**
 * @type {number}
 */
createjs.Event.prototype.eventPhase;

/**
 * @type {boolean}
 */
createjs.Event.prototype.immediatePropagationStopped;

/**
 * @type {boolean}
 */
createjs.Event.prototype.propagationStopped;

/**
 * @type {boolean}
 */
createjs.Event.prototype.removed;

/**
 * @type {Object}
 */
createjs.Event.prototype.target;

/**
 * @type {number}
 */
createjs.Event.prototype.timeStamp;

/**
 * @type {string}
 */
createjs.Event.prototype.type;

/**
 * @return {createjs.Event}
 */
createjs.Event.prototype.clone = function() {};

/**
 *
 */
createjs.Event.prototype.preventDefault = function() {};

/**
 *
 */
createjs.Event.prototype.remove = function() {};

/**
 *
 */
createjs.Event.prototype.stopImmediatePropagation = function() {};

/**
 *
 */
createjs.Event.prototype.stopPropagation = function() {};

/**
 * @return {string}
 */
createjs.Event.prototype.toString = function() {};