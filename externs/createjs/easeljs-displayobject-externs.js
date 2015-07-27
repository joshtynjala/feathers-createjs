/**
 * @fileoverview Externs for easeljs
 * @externs
 */

/**
 * @constructor
 * @extends {createjs.EventDispatcher}
 */
createjs.DisplayObject = function() {};

/**
 * @type {number}
 */
createjs.DisplayObject.prototype.alpha;

/**
 * @type {HTMLCanvasElement|Object}
 */
createjs.DisplayObject.prototype.cacheCanvas;

/**
 * @type {number}
 */
createjs.DisplayObject.prototype.cacheID;

/**
 * @type {string}
 */
createjs.DisplayObject.prototype.compositeOperation;

/**
 * @type {string}
 */
createjs.DisplayObject.prototype.cursor;

/**
 * @type {Array.<createjs.Filter>}
 */
createjs.DisplayObject.prototype.filters;

/**
 * @type {createjs.DisplayObject}
 */
createjs.DisplayObject.prototype.hitArea;

/**
 * @type {number}
 */
createjs.DisplayObject.prototype.id;

/**
 * @type {createjs.Shape}
 */
createjs.DisplayObject.prototype.mask;

/**
 * @type {boolean}
 */
createjs.DisplayObject.prototype.mouseEnabled;

/**
 * @type {string}
 */
createjs.DisplayObject.prototype.name;

/**
 * @deprecated Listen to 'click' event
 * @type {Function}
 */
createjs.DisplayObject.prototype.onClick;

/**
 * @deprecated Listen to 'dblclick' event
 * @type {Function}
 */
createjs.DisplayObject.prototype.onDoubleClick;

/**
 * @deprecated Listen to 'mouseout' event
 * @type {Function}
 */
createjs.DisplayObject.prototype.onMouseOut;

/**
 * @deprecated Listen to 'mouseover' event
 * @type {Function}
 */
createjs.DisplayObject.prototype.onMouseOver;

/**
 * @deprecated Listen to 'mousedown' event
 * @type {Function}
 */
createjs.DisplayObject.prototype.onPress;

/**
 * @deprecated Listen to 'tick' event
 * @type {Function}
 */
createjs.DisplayObject.prototype.onTick;

/**
 * @type {createjs.Container}
 */
createjs.DisplayObject.prototype.parent;

/**
 * @type {number}
 */
createjs.DisplayObject.prototype.regX;

/**
 * @type {number}
 */
createjs.DisplayObject.prototype.regY;

/**
 * @type {number}
 */
createjs.DisplayObject.prototype.rotation;

/**
 * @type {number}
 */
createjs.DisplayObject.prototype.scaleX;

/**
 * @type {number}
 */
createjs.DisplayObject.prototype.scaleY;

/**
 * @type {createjs.Shadow}
 */
createjs.DisplayObject.prototype.shadow;

/**
 * @type {number}
 */
createjs.DisplayObject.prototype.skewX;

/**
 * @type {number}
 */
createjs.DisplayObject.prototype.skewY;

/**
 * @deprecated Hardware acceleration in modern browsers makes this unnecessary.
 * @type {number}
 */
createjs.DisplayObject.prototype.snapToPixel;

/**
 * @type {boolean}
 */
createjs.DisplayObject.suppressCrossDomainErrors;

/**
 * @type {boolean}
 */
createjs.DisplayObject.prototype.visible;

/**
 * @type {number}
 */
createjs.DisplayObject.prototype.x;

/**
 * @type {number}
 */
createjs.DisplayObject.prototype.y;

/**
 * @param {number} x
 * @param {number} y
 * @param {number} width
 * @param {number} height
 * @param {number=} scale
 */
createjs.DisplayObject.prototype.cache = function(x, y, width, height, scale) {};

/**
 * @return {createjs.DisplayObject}
 */
createjs.DisplayObject.prototype.clone = function() {};

/**
 * @param {CanvasRenderingContext2D} ctx
 * @param {boolean=} ignoreCache
 * @return {boolean}
 */
createjs.DisplayObject.prototype.draw = function(ctx, ignoreCache) {};

/**
 * @return {createjs.Rectangle}
 */
createjs.DisplayObject.prototype.getBounds = function() {};

/**
 * @return {string}
 */
createjs.DisplayObject.prototype.getCacheDataURL = function() {};

/**
 * @param {createjs.Matrix2D=} mtx
 * @return {createjs.Matrix2D}
 */
createjs.DisplayObject.prototype.getConcatenatedMatrix = function(mtx) {};

/**
 * @param {createjs.Matrix2D} matrix
 * @return {createjs.Matrix2D}
 */
createjs.DisplayObject.prototype.getMatrix = function(matrix) {};

/**
 * @return {createjs.Stage}
 */
createjs.DisplayObject.prototype.getStage = function() {};

/**
 * @return {createjs.Rectangle}
 */
createjs.DisplayObject.prototype.getTransformedBounds = function() {};

/**
 * @param {number} x
 * @param {number} y
 * @return {createjs.Point}
 */
createjs.DisplayObject.prototype.globalToLocal = function(x, y) {};

/**
 * @param {number} x
 * @param {number} y
 * @return {boolean}
 */
createjs.DisplayObject.prototype.hitTest = function(x, y) {};

/**
 * 
 */
createjs.DisplayObject.prototype.initialize = function() {};

/**
 * @return {boolean}
 */
createjs.DisplayObject.prototype.isVisible = function() {};

/**
 * @param {number} x
 * @param {number} y
 * @return {createjs.Point}
 */
createjs.DisplayObject.prototype.localToGlobal = function(x, y) {};

/**
 * @param {number} x
 * @param {number} y
 * @param {createjs.DisplayObject} target
 * @return {createjs.Point}
 */
createjs.DisplayObject.prototype.localToLocal = function(x, y, target) {};

/**
 * @param {Object} props
 * @return {createjs.DisplayObject}
 */
createjs.DisplayObject.prototype.set = function(props) {};

/**
 * @param {number} x
 * @param {number} y
 * @param {number} width
 * @param {number} height
 */
createjs.DisplayObject.prototype.setBounds = function(x, y, width, height) {};

/**
 * @param {number=} x
 * @param {number=} y
 * @param {number=} scaleX
 * @param {number=} scaleY
 * @param {number=} rotation
 * @param {number=} skewX
 * @param {number=} skewY
 * @param {number=} regX
 * @param {number=} regY
 * @return {createjs.DisplayObject}
 */
createjs.DisplayObject.prototype.setTransform = function(x, y, scaleX, scaleY, rotation, skewX, skewY, regX, regY) {};

/**
 *
 */
createjs.DisplayObject.prototype.uncache = function() {};

/**
 * @param {string} compositeOperation
 */
createjs.DisplayObject.prototype.updateCache = function(compositeOperation) {};

/**
 * @param {CanvasRenderingContext2D} ctx
 */
createjs.DisplayObject.prototype.updateContext = function(ctx) {};