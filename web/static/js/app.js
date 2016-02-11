'use strict';

const scrollTo = require('./scrollTo');

let contactScrollButton = document.getElementsByClassName('contact-us-button')[0];
contactScrollButton.addEventListener('click', (e) => {
  scrollTo('contact');
  e.preventDefault();
}, false)
