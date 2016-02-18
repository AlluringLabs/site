'use strict';

/** Provides Google Analytics Helper Functionality */
class AnalyticsHelper {
  /** Sends a click event to Google Analytics. @see AnalyticsHelper.newEvent */
  static clickEvent(category, label, value) {
    AnalyticsHelper.newEvent(category, 'click', label, value);
  }

  /** Sends a submission event to Google Analytics. @see AnalyticsHelper.newEvent */
  static submissionEvent(category, label, value) {
    AnalyticsHelper.newEvent(category, 'submit', label, value);
  }

  /**
   * Sends a new event to Google Analytics.
   * @param {string} category - Object that was interacted with (e.g. 'Form')
   * @param {string} action - Type of interaction (e.g. 'submit')
   * @param {string} label - Useful for categorizing events (e.g. 'Web Development Campaign')
   * @param {integer} value - Numeric value associated with the event (e.g. 42)
   */
  static newEvent(category, action, label, value) {
    ga('send', 'event', category, action, label, value);
  }

  /**
   * Sends a new page view event to Google Analytics.
   * @param {string} location - URL of the page view
   * @param {string} title - Title of the page that was viewed
   */
  static newPageView(location, title) {
    ga('send', 'pageview', {
      location: location,
      title: title
    });
  }
}

module.exports = AnalyticsHelper;
