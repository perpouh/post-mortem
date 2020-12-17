<template>
  <layout>
    <div>
      <h2>プロジェクト</h2>
      <project-list :projects="projects"></project-list>
    </div>
  </layout>
</template>

<script>
import Layout from './Layout'
import ProjectList from './parts/ProjectList'
export default{
  data(){
    return {
      projects:[]
    }
  },
  components: {
    Layout,
    ProjectList
  },
  created(){
    this.fetchData()
  },
  watch: {
    '$route': 'fetchData'
  },
  methods: {
    fetchData () {
      this.$http.get("/projects")
      .then(function(res){
        this.projects = res.data
      }.bind(this))
    }
  }
}
</script>