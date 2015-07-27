/**
 * @fileoverview Externs for easeljs
 * @externs
 */

/**
 * @constructor
 * @param {number=} a
 * @param {number=} b
 * @param {number=} c
 * @param {number=} d
 * @param {number=} tx
 * @param {number=} ty
 */
createjs.Matrix2D = function(a, b, c, d, tx, ty) {};

/**
 * @type {number}
 */
createjs.Matrix2D.prototype.a;

/**
 * @type {number}
 */
createjs.Matrix2D.prototype.alpha;

/**
 * @type {number}
 */
createjs.Matrix2D.prototype.b;

/**
 * @type {number}
 */
createjs.Matrix2D.prototype.c;

/**
 * @type {string}
 */
createjs.Matrix2D.prototype.compositeOperation;

/**
 * @type {number}
 */
createjs.Matrix2D.prototype.d;

/**
 * @type {number}
 */
createjs.Matrix2D.DEG_TO_RAD;

/**
 * @type {createjs.Matrix2D}
 */
createjs.Matrix2D.identity;

/**
 * @type {createjs.Shadow}
 */
createjs.Matrix2D.prototype.shadow;

/**
 * @type {number}
 */
createjs.Matrix2D.prototype.tx;

/**
 * @type {number}
 */
createjs.Matrix2D.prototype.ty;

/**
 * @param {number} a
 * @param {number} b
 * @param {number} c
 * @param {number} d
 * @param {number} tx
 * @param {number} ty
 * @return {createjs.Matrix2D}
 */
createjs.Matrix2D.prototype.append = function(a, b, c, d, tx, ty) {};

/**
 * @param {createjs.Matrix2D} matrix
 * @return {createjs.Matrix2D}
 */
createjs.Matrix2D.prototype.appendMatrix = function(matrix) {};

/**
 * @param {number} alpha
 * @param {createjs.Shadow} shadow
 * @param {string} compositeOperation
 * @return {createjs.Matrix2D}
 */
createjs.Matrix2D.prototype.appendProperties = function(alpha, shadow, compositeOperation) {};

/**
 * @param {number} x
 * @param {number} y
 * @param {number} scaleX
 * @param {number} scaleY
 * @param {number} rotation
 * @param {number} skewX
 * @param {number} skewY
 * @param {number} regX
 * @param {number} regY
 * @return {createjs.Matrix2D}
 */
createjs.Matrix2D.prototype.appendTransform = function(x, y, scaleX, scaleY, rotation, skewX, skewY, regX, regY) {};

/**
 * @return {createjs.Matrix2D}
 */
createjs.Matrix2D.prototype.clone = function() {};

/**
 * @return {createjs.Matrix2D}
 */
createjs.Matrix2D.prototype.copy = function() {};

/**
 * @param {Object} target
 */
createjs.Matrix2D.prototype.decompose = function(target) {};

/**
 * @return {createjs.Matrix2D}
 */
createjs.Matrix2D.prototype.identity = function() {};

/**
 * @param {number=} a
 * @param {number=} b
 * @param {number=} c
 * @param {number=} d
 * @param {number=} tx
 * @param {number=} ty
 * @return {createjs.Matrix2D}
 */
createjs.Matrix2D.prototype.initialize = function(a, b, c, d, tx, ty) {};

/**
 * @return {createjs.Matrix2D}
 */
createjs.Matrix2D.prototype.invert = function() {};

/**
 * @return {boolean}
 */
createjs.Matrix2D.prototype.isIdentity = function() {};

/**
 * @param {number} a
 * @param {number} b
 * @param {number} c
 * @param {number} d
 * @param {number} tx
 * @param {number} ty
 * @return {createjs.Matrix2D}
 */
createjs.Matrix2D.prototype.prepend = function(a, b, c, d, tx, ty) {};

/**
 * @param {createjs.Matrix2D} matrix
 */
createjs.Matrix2D.prototype.prependMatrix = function(matrix) {};

/**
 * @param {number} alpha
 * @param {createjs.Shadow} shadow
 * @param {string} compositeOperation
 * @return {createjs.Matrix2D}
 */
createjs.Matrix2D.prototype.prependProperties = function(alpha, shadow, compositeOperation) {};

/**
 * @param {number} x
 * @param {number} y
 * @param {number} scaleX
 * @param {number} scaleY
 * @param {number} rotation
 * @param {number} skewX
 * @param {number} skewY
 * @param {number} regX
 * @param {number} regY
 * @return {createjs.Matrix2D}
 */
createjs.Matrix2D.prototype.prependTransform = function(x, y, scaleX, scaleY, rotation, skewX, skewY, regX, regY) {};

/**
 * @param {number=} a
 * @param {number=} b
 * @param {number=} c
 * @param {number=} d
 * @param {number=} tx
 * @param {number=} ty
 * @param {number=} alpha
 * @param {createjs.Shadow=} shadow
 * @param {string=} compositeOperation
 * @return {createjs.Matrix2D}
 */
createjs.Matrix2D.prototype.reinitialize = function(a, b, c, d, tx, ty, alpha, shadow, compositeOperation) {};

/**
 * @param {number} angle
 * @return {createjs.Matrix2D}
 */
createjs.Matrix2D.prototype.rotate = function(angle) {};

/**
 * @param {number} x
 * @param {number} y
 * @return {createjs.Matrix2D}
 */
createjs.Matrix2D.prototype.scale = function(x, y) {};

/**
 * @param {number} skewX
 * @param {number} skewY
 * @return {createjs.Matrix2D}
 */
createjs.Matrix2D.prototype.skew = function(skewX, skewY) {};

/**
 * @return {string}
 */
createjs.Matrix2D.prototype.toString = function() {};

/**
 * @param {number} x
 * @param {number} y
 * @param {createjs.Point|Object} pt
 * @return {createjs.Matrix2D}
 */
createjs.Matrix2D.prototype.transformPoint = function(x, y, pt) {};

/**
 * @param {number} x
 * @param {number} y
 * @return {createjs.Matrix2D}
 */
createjs.Matrix2D.prototype.translate = function(x, y) {};