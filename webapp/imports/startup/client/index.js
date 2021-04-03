import { Meteor } from 'meteor/meteor';
import Vue from 'vue';
import VueMeteorTracker from 'vue-meteor-tracker';
import { Accounts } from 'meteor/accounts-base';
 
Vue.use(VueMeteorTracker);

import App from '../../ui/App.vue';

Accounts.ui.config({
  passwordSignupFields: 'USERNAME_ONLY'
});
 
Meteor.startup(() => {
  new Vue({
    el: '#app',
    ...App,
  });
});