<template>
  <layout>
      <!-- <div class="contents"> -->
      <h2>プロジェクト</h2>
      <form>
        <input type="search" placeholder="検索">
        <select>
          <option>登録日時とか？</option>
        </select>
      </form>
      <router-link to="/project/new" class="btn-primary">新規プロジェクト</router-link>
        <project-list :projects="projects"></project-list>
      <!-- </div> -->
  </layout>
</template>

<script>
import Layout from './layouts/Layout'
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