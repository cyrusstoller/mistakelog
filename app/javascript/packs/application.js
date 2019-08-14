/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

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
