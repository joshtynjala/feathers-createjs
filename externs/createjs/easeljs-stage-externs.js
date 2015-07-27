/**
 * @fileoverview Externs for easeljs
 * @externs
 */

/**
 * @constructor
 * @extends {createjs.Container}
 * @param {HTMLCanvasElement|string|Object} canvas
 */
createjs.Stage = function(canvas) {};

/**
 * @type {boolean}
 */
createjs.Stage.prototype.autoClear;

/**
 * @type {HTMLCanvasElement|Object}
 */
createjs.Stage.prototype.canvas;

/**
 * @type {Function}
 */
createjs.Stage.prototype.handleEvent;

/**
 * @type {boolean}
 */
createjs.Stage.prototype.mouseInBounds;

/**
 * @type {boolean}
 */
createjs.Stage.prototype.mouseMoveOutside;

/**
 * @type {number}
 */
createjs.Stage.prototype.mouseX;

/**
 * @type {number}
 */
createjs.Stage.prototype.mouseY;

/**
 * @type {createjs.Stage}
 */
createjs.Stage.prototype.nextStage;

/**
 * @deprecated Listen to 'stagemousedown' event
 * @type {Function}
 */
createjs.Stage.prototype.onMouseDown;

/**
 * @deprecated Listen to 'stagemousemove' event
 * @type {Function}
 */
createjs.Stage.prototype.onMouseMove;

/**
 * @deprecated Listen to 'stagemouseup' event
 * @type {Function}
 */
createjs.Stage.prototype.onMouseUp;

/**
 * @deprecated Hardware acceleration makes this not beneficial
 * @type {boolean}
 */
createjs.Stage.prototype.snapToPixelEnabled;

/**
 * @type {boolean}
 */
createjs.Stage.prototype.tickOnUpdate;

/**
 *
 */
createjs.Stage.prototype.clear = function() {};

/**
 * @param {boolean=} enable
 */
createjs.Stage.prototype.enableDOMEvents = function(enable) {};

/**
 * @param {number=} frequency
 */
createjs.Stage.prototype.enableMouseOver = function(frequency) {};

/**
 * @param {string} backgroundColor
 * @param {string} mimeType
 * @return {string}
 */
createjs.Stage.prototype.toDataURL = function(backgroundColor, mimeType) {};

/**
 * @param {*=} params
 */
createjs.Stage.prototype.update = function(params) {};