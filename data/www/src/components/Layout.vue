<template>
  <div>
    <header>
      <a href="/" class="bland"><img src="https://placehold.jp/150x50.png"></a>
      <select v-model="selectedProject">
        <option v-for="project in projects" v-bind:key="project.id" :value="project.id">{{project.name}}</option>
      </select>
      <input type="search">
    </header>
    <main>
      <slot />
    </main>
    <footer>
      ©2020 Perpouh.inc.
    </footer>
  </div>
</template>

<script>
export default{
  name: 'Layout',
  data(){
    return {
      projects : [],
      selectedProject: ""
    }
  },
  created(){
    this.fetchData()
  },
  watch: {
    '$route': 'fetchData',
    'selectedProject': 'gotoProjectDetail'
  },
  methods: {
    fetchData () {
      this.$http.get("/projects")
      .then(function(res){
        this.projects = res.data
      }.bind(this))
    },
    gotoProjectDetail () {
      console.log(this.selectedProject)
      this.$router.push({path: `/project/${this.selectedProject}`})
    }
  }
}
</script>

<style>
main{
  max-width: 1260px;
  margin: 0 auto;
}
</style>