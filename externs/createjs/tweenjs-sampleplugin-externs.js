/**
 * @fileoverview Externs for tweenjs
 * @externs
 */

/**
 * @constructor
 */
createjs.SamplePlugin = function() {};

/**
 * @type {*}
 */
createjs.SamplePlugin.priority;

/**
 * @param {createjs.Tween} tween
 * @param {string} prop
 * @param {*} value
 * @return {*}
 */
createjs.SamplePlugin.init = function(tween, prop, value) {};

/**
 * @param {createjs.Tween} tween
 * @param {string} prop
 * @param {*} startValue
 * @param {string} injectProps
 * @param {*} endValue
 */
createjs.SamplePlugin.step = function(tween, prop, startValue, injectProps, endValue) {};

/**
 * 
 */
createjs.SamplePlugin.install = function() {};

/**
 * @param {createjs.Tween} tween
 * @param {string} prop
 * @param {*} value
 * @param {Object} startValues
 * @param {Object} endValues
 * @param {number} ratio
 * @param {boolean} wait
 * @param {boolean} end
 * @return {*}
 */
createjs.SamplePlugin.tween = function(tween, prop, value, startValues, endValues, ratio, wait, end) {};