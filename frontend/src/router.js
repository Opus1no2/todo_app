import Vue from 'vue';
import Router from 'vue-router';
import Login from './views/Login.vue';
import Dashboard from './views/Dashboard.vue';
import SignUp from './views/SignUp.vue';

Vue.use(Router);

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'login',
      component: Login,
    }, {
      path: '/dashboard',
      name: 'dashboard',
      component: Dashboard,
    }, {
      path: '/sign_up',
      name: 'signup',
      component: SignUp,
    },
  ],
});
