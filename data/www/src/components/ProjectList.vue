<template>
  <layout>
    <ul>
      <li v-for="project in projects" v-bind:key="project.id">
        <router-link :to="`/project/${project.id}`">{{project.name}}</router-link>
      </li>
    </ul>
  </layout>
</template>

<script>
import Layout from './Layout'
export default{
  name: 'ProjectList',
  data(){
    return {
      projects : []
    }
  },
  components: {
    Layout
  },
  created(){
    this.fetchData()
  },
  watch: {
    '$route': 'fetchData'
  },
  methods: {
    fetchData () {
      this.$http.get("/projects")()
      .then(function(res){
        this.projects = res.data
      }.bind(this))
    }
  }
}
</script>