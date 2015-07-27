/**
 * @fileoverview Externs for easeljs
 * @externs
 */

/**
 * @constructor
 * @param {string} type
 * @param {number} stageX
 * @param {number} stageY
 * @param {createjs.DisplayObject} target
 * @param {UIEvent} nativeEvent
 * @param {number} pointerID
 * @param {boolean} primary
 * @param {number} rawX
 * @param {number} rawY
 * @extends {createjs.Event}
 */
createjs.MouseEvent = function(type, stageX, stageY, target, nativeEvent, pointerID, primary, rawX, rawY) {};

/**
 * @type {UIEvent}
 */
createjs.MouseEvent.prototype.nativeEvent;

/**
 * @deprecated Listen to 'pressmove' event
 * @type {Function}
 */
createjs.MouseEvent.prototype.onMouseMove;

/**
 * @deprecated Listen to 'pressUp' event
 * @type {Function}
 */
createjs.MouseEvent.prototype.onMouseUp;

/**
 * @type {number}
 */
createjs.MouseEvent.prototype.pointerID;

/**
 * @type {boolean}
 */
createjs.MouseEvent.prototype.primary;

/**
 * @type {number}
 */
createjs.MouseEvent.prototype.rawX;

/**
 * @type {number}
 */
createjs.MouseEvent.prototype.rawY;

/**
 * @type {number}
 */
createjs.MouseEvent.prototype.stageX;

/**
 * @type {number}
 */
createjs.MouseEvent.prototype.stageY;

/**
 * @param {string} type
 * @param {Function|Object} listener
 * @param {boolean=} useCapture
 * @return {Function|Object}
 */
createjs.MouseEvent.prototype.addEventListener  = function(type, listener, useCapture) {};

/**
 * @param {Object|String} eventObj
 * @param {Object=} target
 * @return {boolean}
 */
createjs.MouseEvent.prototype.dispatchEvent = function(eventObj, target) {};

/**
 * @param {string} type
 * @return {boolean}
 */
createjs.MouseEvent.prototype.hasEventListener = function(type) {};

/**
 * @param {Object} target 
 */
createjs.MouseEvent.initialize = function(target) {};

/**
 * @param {string} type
 * @param {Function|Object} listener
 * @param {boolean=} useCapture
 * @return {boolean}
 */
createjs.MouseEvent.prototype.off = function(type, listener, useCapture) {};

/**
 * @param {string} type
 * @param {Function|Object} listener
 * @param {Object=} scope
 * @param {boolean=} once
 * @param {*=} data
 * @param {boolean=} useCapture
 * @return {boolean}
 */
createjs.MouseEvent.prototype.on = function(type, listener, scope, once, data, useCapture) {};

/**
 * @param {string=} type
 */
createjs.MouseEvent.prototype.removeAllEventListeners = function(type) {};

/**
 * @param {string} type
 * @param {Function|Object} listener
 * @param {boolean=} useCapture
 */
createjs.MouseEvent.prototype.removeEventListener = function(type, listener, useCapture) {};

/**
 * @return {string}
 */
createjs.MouseEvent.prototype.toString = function() {};