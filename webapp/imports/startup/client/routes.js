import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

import Todo from '../../ui/pages/Todo.vue'
import About from '../../ui/pages/About.vue'
import Hobbies from '../../ui/pages/Hobbies.vue'
import NotFound from '../../ui/pages/NotFound.vue'

const routes = [
  {
    path: "/",
    name: "Todo",
    component: Todo
  },
  {
    path: "/about",
    name: "About",
    component: About
  },
  {
    path: "/hobbies",
    name: 'Hobbies',
    component: Hobbies
  },
  {
    path: "*",
    name: 'NotFound',
    component: NotFound
  }
]

const router = new VueRouter({
  routes
})

export default router