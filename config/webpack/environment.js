const { environment } = require('@rails/webpacker');
const { VueLoaderPlugin } = require('vue-loader');

const vue = require('./loaders/vue');
const erb = require('./loaders/erb');

const WindiCSSWebpackPlugin = require("windicss-webpack-plugin");

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin());
environment.plugins.append('WindiCSSWebpackPlugin', new WindiCSSWebpackPlugin());
environment.loaders.prepend('vue', vue);
environment.loaders.append('erb', erb);

module.exports = environment;
