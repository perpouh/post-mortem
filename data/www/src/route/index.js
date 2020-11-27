import Vue from 'vue/dist/vue.esm'
import Router from 'vue-router'
// import Signin from '@/components/Signin'
import ProjectList from '@/components/ProjectList'
import ProjectDetail from '@/components/ProjectDetail'
import TicketForm from '@/components/TicketForm'

Vue.use(Router)

export default new Router({
  routes: [
    // { path: '/', component: DashBoard },
    {path: '/projects', component: ProjectList},
    {path: '/project/:id', component: ProjectDetail},
    {path: '/project/:id/ticket/new', component: TicketForm}
  ]
})