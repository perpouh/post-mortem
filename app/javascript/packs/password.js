import Vue from 'vue'
import Password from '@/../components/password.vue'

document.addEventListener('DOMContentLoaded', () => {
  const container = document.querySelector("#app")
  if (container === null) return

  const app = new Vue({
    render: h => h(Password)
  }).$mount()
  container.appendChild(app.$el)
})
