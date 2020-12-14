import Vue from 'vue/dist/vue.esm'
import Router from 'vue-router'
import Signin from '@/components/Signin'
import ProjectList from '@/components/ProjectList'
import ProjectDetail from '@/components/ProjectDetail'
import TicketForm from '@/components/TicketForm'
import TicketDetail from '@/components/TicketDetail'

Vue.use(Router)

export default new Router({
  routes: [
    // {path: '', component: },
    {path: '/sign_in', component: Signin},
    {path: '/projects', component: ProjectList},
    {path: '/project/:id', component: ProjectDetail},
    {path: '/project/:project_id/ticket/new', component: TicketForm},
    {path: '/project/:project_id/ticket/:id', component: TicketDetail}
  ]
})