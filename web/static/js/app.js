'use strict';

const scrollTo = require('./scrollTo');

let contactScrollButton = document.getElementsByClassName('contact-us-button')[0];
if (contactScrollButton) {
  contactScrollButton.addEventListener('click', (e) => {
    scrollTo('contact');
    e.preventDefault();
  }, false);
}


let serviceTypeEles = document.getElementsByClassName('service-type');
// The code must be wrapped in a loop and a self calling closure to  be able
// to add the event to all of the labels on the page.
for (let i=0; i<serviceTypeEles.length; i++) {
  ((ind) => {
    serviceTypeEles[ind].addEventListener('keypress', (e) => {
      const enterKeyCode = 13;
      let tar = e.target || e.srcElement;

      if (e.keyCode == enterKeyCode) {
        tar.click();
      }
    });
  })(i);
}
