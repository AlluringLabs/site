'use strict';

module.exports = function(elementId, scrollBy, scrollIntervalSpeed) {
  const scrollByAmount = scrollBy || 15;
  const scrollIntervalTime = scrollIntervalSpeed || 5;

  let ele = document.getElementById(elementId);
  let positionFromTopOfPage = window.pageYOffset;
  let elePos = ele.offsetTop;

  let scrollInterval = setInterval(() => {
    if (window.pageYOffset - elePos <= -20) {
      // We are above the element so we will scroll down.
      window.scrollBy(0, scrollByAmount);
    }
    else if (window.pageYOffset - elePos >= 20) {
      // We are below the element so we will scroll up.
      window.scrollBy(0, -scrollByAmount);
    }
    else {
      clearInterval(scrollInterval);
    }
  }, scrollIntervalTime);
};
