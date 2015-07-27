/**
 * @fileoverview Externs for easeljs
 * @externs
 */

/**
 * @constructor
 */
createjs.Graphics = function() {};

/**
 * @type {Object}
 */
createjs.Graphics.BASE_64;

/**
 * @type {Function}
 */
createjs.Graphics.Command;

/**
 * @type {Array}
 */
createjs.Graphics.STROKE_CAPS_MAP;

/**
 * @type {Array}
 */
createjs.Graphics.STROKE_JOINTS_MAP;

/**
 * @param {number} x
 * @param {number} y
 * @param {number} radius
 * @param {number} startAngle
 * @param {number} endAngle
 * @param {boolean} anticlockwise
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.a = function(x, y, radius, startAngle, endAngle, anticlockwise) {};

/**
 * @param {number} x
 * @param {number} y
 * @param {number} radius
 * @param {number} startAngle
 * @param {number} endAngle
 * @param {boolean} anticlockwise
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.arc = function(x, y, radius, startAngle, endAngle, anticlockwise) {};

/**
 * @param {number} x1
 * @param {number} y1
 * @param {number} x2
 * @param {number} y2
 * @param {number} radius
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.at = function(x1, y1, x2, y2, radius) {};

/**
 * @param {number} x1
 * @param {number} y1
 * @param {number} x2
 * @param {number} y2
 * @param {number} radius
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.arcTo = function(x1, y1, x2, y2, radius) {};

/**
 * @param {HTMLImageElement|HTMLCanvasElement|HTMLVideoElement} image
 * @param {string} repetition
 * @param {createjs.Matrix2D} matrix
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.bf = function(image, repetition, matrix) {};

/**
 * @param {HTMLImageElement|HTMLCanvasElement|HTMLVideoElement} image
 * @param {string} repetition
 * @param {createjs.Matrix2D} matrix
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.beginBitmapFill = function(image, repetition, matrix) {};

/**
 * @param {HTMLImageElement|HTMLCanvasElement|HTMLVideoElement} image
 * @param {string=} repetition
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.bs = function(image, repetition) {};

/**
 * @param {HTMLImageElement|HTMLCanvasElement|HTMLVideoElement} image
 * @param {string=} repetition
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.beginBitmapStroke = function(image, repetition) {};

/**
 * @param {string} color
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.f = function(color) {};

/**
 * @param {string} color
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.beginFill = function(color) {};

/**
 * @param {Array.<string>} colors
 * @param {Array.<number>} ratios
 * @param {number} x0
 * @param {number} y0
 * @param {number} x1
 * @param {number} y1
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.lf = function(colors, ratios, x0, y0, x1, y1) {};

/**
 * @param {Array.<string>} colors
 * @param {Array.<number>} ratios
 * @param {number} x0
 * @param {number} y0
 * @param {number} x1
 * @param {number} y1
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.beginLinearGradientFill = function(colors, ratios, x0, y0, x1, y1) {};

/**
 * @param {Array.<string>} colors
 * @param {Array.<number>} ratios
 * @param {number} x0
 * @param {number} y0
 * @param {number} x1
 * @param {number} y1
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.ls = function(colors, ratios, x0, y0, x1, y1) {};

/**
 * @param {Array.<string>} colors
 * @param {Array.<number>} ratios
 * @param {number} x0
 * @param {number} y0
 * @param {number} x1
 * @param {number} y1
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.beginLinearGradientStroke = function(colors, ratios, x0, y0, x1, y1) {};

/**
 * @param {Array.<string>} colors
 * @param {Array.<number>} ratios
 * @param {number} x0
 * @param {number} y0
 * @param {number} r0
 * @param {number} x1
 * @param {number} y1
 * @param {number} r1
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.rf = function(colors, ratios, x0, y0, r0, x1, y1, r1) {};

/**
 * @param {Array.<string>} colors
 * @param {Array.<number>} ratios
 * @param {number} x0
 * @param {number} y0
 * @param {number} r0
 * @param {number} x1
 * @param {number} y1
 * @param {number} r1
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.beginRadialGradientFill = function(colors, ratios, x0, y0, r0, x1, y1, r1) {};

/**
 * @param {Array.<string>} colors
 * @param {Array.<number>} ratios
 * @param {number} x0
 * @param {number} y0
 * @param {number} r0
 * @param {number} x1
 * @param {number} y1
 * @param {number} r1
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.rs = function(colors, ratios, x0, y0, r0, x1, y1, r1) {};

/**
 * @param {Array.<string>} colors
 * @param {Array.<number>} ratios
 * @param {number} x0
 * @param {number} y0
 * @param {number} r0
 * @param {number} x1
 * @param {number} y1
 * @param {number} r1
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.beginRadialGradientStroke = function(colors, ratios, x0, y0, r0, x1, y1, r1) {};

/**
 * @param {string} color
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.s = function(color) {};

/**
 * @param {string} color
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.beginStroke = function(color) {};

/**
 * @param {number} cp1x
 * @param {number} cp1y
 * @param {number} cp2x
 * @param {number} cp2y
 * @param {number} x
 * @param {number} y
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.bt = function(cp1x, cp1y, cp2x, cp2y, x, y) {};

/**
 * @param {number} cp1x
 * @param {number} cp1y
 * @param {number} cp2x
 * @param {number} cp2y
 * @param {number} x
 * @param {number} y
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.bezierCurveTo = function(cp1x, cp1y, cp2x, cp2y, x, y) {};

/**
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.c = function() {};


/**
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.clear = function() {};

/**
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.clone = function() {};

/**
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.cp = function() {};

/**
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.closePath = function() {};

/**
 *
 */
createjs.Graphics.prototype.curveTo = function() {};

/**
 * @param {string} str
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.p = function(str) {};

/**
 * @param {string} str
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.decodePath = function(str) {};

/**
 * @param {CanvasRenderingContext2D} ctx
 */
createjs.Graphics.prototype.draw = function(ctx) {};

/**
 * @param {CanvasRenderingContext2D} ctx
 */
createjs.Graphics.prototype.drawAsPath = function(ctx) {};

/**
 * @param {number} x
 * @param {number} y
 * @param {number} radius
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.dc = function(x, y, radius) {};

/**
 * @param {number} x
 * @param {number} y
 * @param {number} radius
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.drawCircle = function(x, y, radius) {};

/**
 * @param {number} x
 * @param {number} y
 * @param {number} w
 * @param {number} h
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.de = function(x, y, w, h) {};

/**
 * @param {number} x
 * @param {number} y
 * @param {number} w
 * @param {number} h
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.drawEllipse = function(x, y, w, h) {};

/**
 * @param {number} x
 * @param {number} y
 * @param {number} radius
 * @param {number} sides
 * @param {number} pointSize
 * @param {number} angle
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.dp = function(x, y, radius, sides, pointSize, angle) {};

/**
 * @param {number} x
 * @param {number} y
 * @param {number} radius
 * @param {number} sides
 * @param {number} pointSize
 * @param {number} angle
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.drawPolyStar = function(x, y, radius, sides, pointSize, angle) {};

/**
 * @param {number} x
 * @param {number} y
 * @param {number} w
 * @param {number} h
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.dr = function(x, y, w, h) {};

/**
 * @param {number} x
 * @param {number} y
 * @param {number} w
 * @param {number} h
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.drawRect = function(x, y, w, h) {};

/**
 * @param {number} x
 * @param {number} y
 * @param {number} w
 * @param {number} h
 * @param {number} radius
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.rr = function(x, y, w, h, radius) {};

/**
 * @param {number} x
 * @param {number} y
 * @param {number} w
 * @param {number} h
 * @param {number} radius
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.drawRoundRect = function(x, y, w, h, radius) {};

/**
 * @param {number} x
 * @param {number} y
 * @param {number} w
 * @param {number} h
 * @param {number} radiusTL
 * @param {number} radiusTR
 * @param {number} radiusBR
 * @param {number} radiusBL
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.rc = function(x, y, w, h, radiusTL, radiusTR, radiusBR, radiusBL) {};

/**
 * @param {number} x
 * @param {number} y
 * @param {number} w
 * @param {number} h
 * @param {number} radiusTL
 * @param {number} radiusTR
 * @param {number} radiusBR
 * @param {number} radiusBL
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.drawRoundRectComplex = function(x, y, w, h, radiusTL, radiusTR, radiusBR, radiusBL) {};

/**
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.ef = function() {};

/**
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.endFill = function() {};

/**
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.es = function() {};

/**
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.endStroke = function() {};

/**
 * @param {number} hue
 * @param {number} saturation
 * @param {number} lightness
 * @param {number=} alpha
 * @return {string}
 */
createjs.Graphics.getHSL = function(hue, saturation, lightness, alpha) {};

/**
 * @param {number} r
 * @param {number} g
 * @param {number} b
 * @param {number=} alpha
 * @return {string}
 */
createjs.Graphics.getRGB = function(r, g, b, alpha) {};

/**
 * 
 */
createjs.Graphics.prototype.initialize = function() {};

/**
 * @param {Function} callback
 * @param {Object} data
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.inject = function(callback, data) {};

/**
 * @return {boolean}
 */
createjs.Graphics.isEmpty = function() {};

/**
 * @param {number} x
 * @param {number} y
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.lt = function(x, y) {};

/**
 * @param {number} x
 * @param {number} y
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.lineTo = function(x, y) {};

/**
 * @param {number} x
 * @param {number} y
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.mt = function(x, y) {};

/**
 * @param {number} x
 * @param {number} y
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.moveTo = function(x, y) {};

/**
 * @param {number} cpx
 * @param {number} cpy
 * @param {number} x
 * @param {number} y
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.qt = function(cpx, cpy, x, y) {};

/**
 * @param {number} cpx
 * @param {number} cpy
 * @param {number} x
 * @param {number} y
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.quadraticCurveTo = function(cpx, cpy, x, y) {};

/**
 * @param {number} x
 * @param {number} y
 * @param {number} w
 * @param {number} h
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.r = function(x, y, w, h) {};

/**
 * @param {number} x
 * @param {number} y
 * @param {number} w
 * @param {number} h
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.rect = function(x, y, w, h) {};

/**
 * @param {number} thickness
 * @param {string|number=} caps
 * @param {string|number=} joints
 * @param {number=} miterLimit
 * @param {boolean=} ignoreScale
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.ss = function(thickness, caps, joints, miterLimit, ignoreScale) {};

/**
 * @param {number} thickness
 * @param {string|number=} caps
 * @param {string|number=} joints
 * @param {number=} miterLimit
 * @param {boolean=} ignoreScale
 * @return {createjs.Graphics}
 */
createjs.Graphics.prototype.setStrokeStyle = function(thickness, caps, joints, miterLimit, ignoreScale) {};

/**
 * @return {string}
 */
createjs.Graphics.prototype.toString = function() {};