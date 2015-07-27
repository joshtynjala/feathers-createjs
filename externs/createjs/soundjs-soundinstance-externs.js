/**
 * @fileoverview Externs for soundjs
 * @externs
 */

/**
 * @constructor
 * @extends {createjs.EventDispatcher}
 * @param {string} src
 * @param {Object} owner
 */
createjs.SoundInstance = function(src, owner) {};

/**
 * @type {string}
 */
createjs.SoundInstance.prototype.gainNode;

/**
 * @deprecated Listen to 'complete' event
 * @type {Function}
 */
createjs.SoundInstance.prototype.onComplete;

/**
 * @deprecated Listen to 'loop' event
 * @type {Function}
 */
createjs.SoundInstance.prototype.onLoop;

/**
 * @deprecated Listen to 'failed' event
 * @type {Function}
 */
createjs.SoundInstance.prototype.onPlayFailed;

/**
 * @deprecated Listen to 'interrupted' event
 * @type {Function}
 */
createjs.SoundInstance.prototype.onPlayInterrupted;

/**
 * @deprecated Listen to 'succeeded' event
 * @type {Function}
 */
createjs.SoundInstance.prototype.onPlaySucceeded;

/**
 * @deprecated Listen to 'ready' event
 * @type {Function}
 */
createjs.SoundInstance.prototype.onReady;

/**
 * @type {number}
 */
createjs.SoundInstance.prototype.pan;

/**
 * @type {Node|Element|null}
 */
createjs.SoundInstance.prototype.panNode;

/**
 * @type {string}
 */
createjs.SoundInstance.prototype.playState;

/**
 * @type {Node|Element|null}
 */
createjs.SoundInstance.prototype.sourceNode;

/**
 * @type {string|number}
 */
createjs.SoundInstance.prototype.uniqueId;

/**
 * @type {number}
 */
createjs.SoundInstance.prototype.volume;

/**
 * @return {number}
 */
createjs.SoundInstance.prototype.getDuration = function() {};

/**
 * @return {boolean}
 */
createjs.SoundInstance.prototype.getMute = function() {};

/**
 * @return {number}
 */
createjs.SoundInstance.prototype.getPan = function() {};

/**
 * @return {number}
 */
createjs.SoundInstance.prototype.getPosition = function() {};

/**
 * @return {number}
 */
createjs.SoundInstance.prototype.getVolume = function() {};

/**
 * @deprecated Use setMute instead.
 * @param {string} value
 * @return {boolean}
 */
createjs.SoundInstance.prototype.mute = function(value) {};

/**
 * @return {boolean}
 */
createjs.SoundInstance.prototype.pause = function() {};

/**
 * @param {string|Object=} interrupt
 * @param {number=} delay
 * @param {number=} offset
 * @param {number=} loop
 * @param {number=} volume
 * @param {number=} pan
 */
createjs.SoundInstance.prototype.play = function(interrupt, delay, offset, loop, volume, pan) {};

/**
 * @return {boolean}
 */
createjs.SoundInstance.prototype.resume = function() {};

/**
 * @param {boolean} value
 * @return {boolean}
 */
createjs.SoundInstance.prototype.setMute = function(value) {};

/**
 * @param {number} value
 * @return {number|boolean}
 */
createjs.SoundInstance.prototype.setPan = function(value) {};

/**
 * @param {number} value
 */
createjs.SoundInstance.prototype.setPosition = function(value) {};

/**
 * @param {number} value
 * @return {boolean}
 */
createjs.SoundInstance.prototype.setVolume = function(value) {};

/**
 * @return {boolean}
 */
createjs.SoundInstance.prototype.stop = function() {};