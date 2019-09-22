import axios from 'axios'
import Vue from 'vue/dist/vue.esm'

import InputWithTags from '../components/inputWithTags.vue'
import Markdown from '../components/markdown.vue'

Vue.component('input-with-tags', InputWithTags)
Vue.component('markdown', Markdown)

import TurbolinksAdapter from 'vue-turbolinks'

Vue.use(TurbolinksAdapter)
Vue.config.productionTip = false
Vue.prototype.$http = axios

document.addEventListener('turbolinks:load', () => {
  axios.defaults.headers.common = {
    "Accept": "application/json, text/plain, */*",
    "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
    "X-Requested-With": "XMLHttpRequest"
  }

  var container = document.querySelector('[vue-enabled]')
  if (container != null) {
    const app = new Vue({
    }).$mount(container)
  }
})
