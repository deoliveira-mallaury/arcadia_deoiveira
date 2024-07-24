import './bootstrap.js';
/*
 * Welcome to your app's main JavaScript file!
 *
 * This file will be included onto the page via the importmap() Twig function,
 * which should already be in your base.html.twig.
 */
// loads the jquery package from node_modules
import $ from 'jquery';
import { Turbo } from '@hotwired/turbo';
Turbo.start();

// import the function from greet.js (the .js extension is optional)
// ./ (or ../) means to look for a local file
import loginformValidator from './loginformValidator.js';



$(document).ready(function () {
    loginformValidator()
 

    // $('body').prepend('<h1>' +  + '</h1>');
});