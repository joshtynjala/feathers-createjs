/**
 * @fileoverview Externs for easeljs
 * @externs
 */

/**
 * @constructor
 * @extends {createjs.DisplayObject}
 */
createjs.Container = function() {};

/**
 * @type {Array.<createjs.DisplayObject>}
 */
createjs.Container.prototype.children;

/**
 * @type {boolean}
 */
createjs.Container.prototype.mouseChildren;

/**
 * @param {createjs.DisplayObject} child
 * @return {createjs.DisplayObject}
 */
createjs.Container.prototype.addChild = function(child) {};

/**
 * @param {createjs.DisplayObject} child
 * @param {number} index
 * @return {createjs.DisplayObject}
 */
createjs.Container.prototype.addChildAt = function(child, index) {};

/**
 * @param {createjs.DisplayObject} child
 * @return {boolean}
 */
createjs.Container.prototype.contains = function(child) {};

/**
 * @param {number} index
 * @return {createjs.DisplayObject}
 */
createjs.Container.prototype.getChildAt = function(index) {};

/**
 * @param {string} name 
 * @return {createjs.DisplayObject} 
 */
createjs.Container.prototype.getChildByName = function(name) {};

/**
 * @param {createjs.DisplayObject} child
 * @return {number}
 */
createjs.Container.prototype.getChildIndex = function(child) {};

/**
 * @return {number}
 */
createjs.Container.prototype.getNumChildren = function() {};

/**
 * @param {number} x
 * @param {number} y
 * @return {Array.<createjs.DisplayObject>}
 */
createjs.Container.prototype.getObjectsUnderPoint = function(x, y) {};

/**
 * @param {number} x
 * @param {number} y
 * @return {createjs.DisplayObject}
 */
createjs.Container.prototype.getObjectUnderPoint = function(x, y) {};

/**
 * 
 */
createjs.Container.prototype.initialize = function() {};

/**
 *
 */
createjs.Container.prototype.removeAllChildren = function() {};

/**
 * @param {createjs.DisplayObject} child
 * @return {boolean}
 */
createjs.Container.prototype.removeChild = function(child) {};

/**
 * @param {number} index
 * @return {boolean}
 */
createjs.Container.prototype.removeChildAt = function(index) {};

/**
 * @param {createjs.DisplayObject} child
 * @param {number} index
 */
createjs.Container.prototype.setChildIndex = function(child, index) {};

/**
 * @param {Function} sortFunction
 */
createjs.Container.prototype.sortChildren = function(sortFunction) {};

/**
 * @param {createjs.DisplayObject} child1
 * @param {createjs.DisplayObject} child2
 */
createjs.Container.prototype.swapChildren = function(child1, child2) {};

/**
 * @param {number} index1
 * @param {number} index2
 */
createjs.Container.prototype.swapChildrenAt = function(index1, index2) {};