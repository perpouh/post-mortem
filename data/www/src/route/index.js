import Vue from 'vue/dist/vue.esm'
import Router from 'vue-router'
// import Signin from '@/components/Signin'
import ProjectList from '@/components/ProjectList'
import ProjectDetail from '@/components/ProjectDetail'

Vue.use(Router)

export default new Router({
  routes: [
    // { path: '/', component: DashBoard },
    {path: '/projects', component: ProjectList},
    {path: '/project/:id', component: ProjectDetail}
  ]
})