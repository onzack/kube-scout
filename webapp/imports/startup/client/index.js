import { Meteor } from 'meteor/meteor';
import Vue from 'vue';
import VueMeteorTracker from 'vue-meteor-tracker';
import { Accounts } from 'meteor/accounts-base';
import router from './routes'
// import VueMaterial from 'vue-material'
// import 'vue-material/dist/vue-material.min.css'
// import 'vue-material/dist/theme/default.css'
// 
// Vue.use(VueMaterial)
Vue.use(VueMeteorTracker);

import App from '../../ui/App.vue';

Accounts.ui.config({
  passwordSignupFields: 'USERNAME_ONLY'
});
 
Meteor.startup(() => {
  new Vue({
    router,
    el: '#app',
    ...App,
  });
});