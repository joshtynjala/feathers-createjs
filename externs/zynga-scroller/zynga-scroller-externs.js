/**
 * @fileoverview Externs for Zynga Scroller
 * @externs
 * @see https://github.com/zynga/scroller
 */

/**
 * @interface
 */
function ScrollerOptions() {};

/**
 * @type {boolean}
 */
ScrollerOptions.prototype.scrollingX;

/**
 * @type {boolean}
 */
ScrollerOptions.prototype.scrollingY;

/**
 * @type {boolean}
 */
ScrollerOptions.prototype.animating;

/**
 * @type {number}
 */
ScrollerOptions.prototype.animationDuration;

/**
 * @type {boolean}
 */
ScrollerOptions.prototype.bouncing;

/**
 * @type {boolean}
 */
ScrollerOptions.prototype.locking;

/**
 * @type {boolean}
 */
ScrollerOptions.prototype.paging;

/**
 * @type {boolean}
 */
ScrollerOptions.prototype.snapping;

/**
 * @type {boolean}
 */
ScrollerOptions.prototype.zooming;

/**
 * @type {number}
 */
ScrollerOptions.prototype.minZoom;

/**
 * @type {number}
 */
ScrollerOptions.prototype.maxZoom;

/**
 * @type {number}
 */
ScrollerOptions.prototype.speedMultiplier;

/**
 * @type {function():undefined}
 */
ScrollerOptions.prototype.scrollingComplete;

/**
 * @type {number}
 */
ScrollerOptions.prototype.penetrationDeceleration;

/**
 * @type {number}
 */
ScrollerOptions.prototype.penetrationAcceleration;

/**
 * @interface
 */
function ScrollerValues() {};

/**
 * @type {number}
 */
ScrollerValues.prototype.left;

/**
 * @type {number}
 */
ScrollerValues.prototype.top;

/**
 * @type {number}
 */
ScrollerValues.prototype.zoom;

/**
 * @constructor
 * @param {!function(number, number, number):undefined} callback
 * @param {Object=} options
 */
function Scroller(callback, options) {};

/**
 * @type {!ScrollerOptions}
 */
Scroller.prototype.options;

/**
 * @param {number=} clientWidth
 * @param {number=} clientHeight
 * @param {number=} contentWidth
 * @param {number=} contentHeight
 */
Scroller.prototype.setDimensions = function(clientWidth, clientHeight, contentWidth, contentHeight) {};

/**
 * @param {number=} clientLeft
 * @param {number=} clientTop
 */
Scroller.prototype.setPosition = function(clientLeft, clientTop) {};

/**
 * @param {number} width
 * @param {number} height
 */
Scroller.prototype.setSnapSize = function(width, height) {};

/**
 * @param {number} height
 * @param {function():undefined} activate
 * @param {function():undefined} deactivate
 * @param {function():undefined} start
 */
Scroller.prototype.activatePullToRefresh = function(height, activate, deactivate, start) {};

/**
 *
 */
Scroller.prototype.finishPullToRefresh = function() {};

/**
 * @return {ScrollerValues}
 */
Scroller.prototype.getValues = function() {};

/**
 * @param {number} level
 * @param {boolean=} animate
 * @param {number=} originLeft
 * @param {number=} originTop
 * @param {function():undefined=} callback
 */
Scroller.prototype.zoomTo = function(level, animate, originLeft, originTop, callback) {};

/**
 * @param {number} factor
 * @param {boolean=} animate
 * @param {number=} originLeft
 * @param {number=} originTop
 * @param {function():undefined=} callback
 */
Scroller.prototype.zoomBy = function(factor, animate, originLeft, originTop, callback) {};

/**
 * @param {number=} left
 * @param {number=} top
 * @param {boolean=} animate
 * @param {number=} zoom
 */
Scroller.prototype.scrollTo = function(left, top, animate, zoom) {};

/**
 * @param {number=} left
 * @param {number=} top
 * @param {boolean=} animate
 */
Scroller.prototype.scrollBy = function(left, top, animate) {};

/**
 * @param {number} wheelDelta
 * @param {number} timeStamp
 * @param {number} pageX
 * @param {number} pageY
 */
Scroller.prototype.doMouseZoom = function(wheelDelta, timeStamp, pageX, pageY) {};

/**
 * @param {!Array|!TouchList} touches
 * @param {number} timeStamp
 */
Scroller.prototype.doTouchStart = function(touches, timeStamp) {};

/**
 * @param {!Array|!TouchList} touches
 * @param {number} timeStamp
 * @param {number=} scale
 */
Scroller.prototype.doTouchMove = function(touches, timeStamp, scale) {};

/**
 * @param {number} timeStamp
 */
Scroller.prototype.doTouchEnd = function(timeStamp) {};