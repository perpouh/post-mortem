import Vue from 'vue/dist/vue.esm'
import Router from 'vue-router'
import Signin from '@/components/Signin'
import ProjectForm from '@/components/ProjectForm'
import Dashboard from '@/components/Dashboard'
import ProjectList from '@/components/ProjectList'
import Search from '@/components/Search'
import Tag from '@/components/Tag'

import TicketList from '@/components/project/TicketList'
import TicketForm from '@/components/project/TicketForm'
import TicketDetail from '@/components/project/TicketDetail'
import ProjectDetail from '@/components/project/ProjectDetail'
import ProjectSetting from '@/components/project/ProjectSetting'

import UserSetting from '@/components/UserSetting'

Vue.use(Router)

let router =  new Router({
  routes: [
    // {path: '', component: },
    {path: '/', component: Dashboard},
    {path: '/sign_in', component: Signin, meta: { isPublic: true }},
    {path: '/search', component: Search},
    {path: '/tag/:tag', component: Tag},
    {path: '/project/new', component: ProjectForm},
    {path: '/projects', component: ProjectList},
    {path: '/project/:id', component: TicketList},
    {path: '/project/:id/summary', component: ProjectDetail},
    {path: '/project/:id/setting', component: ProjectSetting},
    {path: '/project/:project_id/ticket/new', component: TicketForm},
    {path: '/project/:project_id/ticket/:id', component: TicketDetail},
    {path: '/settings', component: UserSetting}
  ]
})

router.beforeEach((to, from, next) => {
  // isPublic でない場合(=認証が必要な場合)、かつ、ログインしていない場合
  if (to.matched.some(record => !record.meta.isPublic) && !router.app.$stores.getters['auth/loggedIn']) {
    next({ path: '/sign_in', query: { redirect: to.fullPath }});
  } else {
    next();
  }
});

export default router