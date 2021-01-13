<template>
  <div>
    <header>
      <a href="/" class="bland"><img src="https://placehold.jp/150x50.png"></a>
      <select v-model="selectedProject">
        <option v-for="project in projects" v-bind:key="project.id" :value="project.id">{{project.name}}</option>
      </select>
      <input type="search" v-model="searchWord" v-on:keydown.enter="submit">
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
      selectedProject: "",
      searchWord: ""
    }
  },
  created(){
    this.fetchData();
    this.searchWord = this.$route.query.q;
  },
  watch: {
    '$route': 'fetchData',
    'selectedProject': 'gotoProjectDetail'
  },
  methods: {
    fetchData () {
      // this.$http.get("/projects")
      // .then(function(res){
      //   this.projects = res.data
      // }.bind(this))
    },
    gotoProjectDetail () {
      console.log(this.selectedProject)
      this.$router.push({path: `/project/${this.selectedProject}`})
    },
    submit(){
      // 日本語入力中のEnterは無視する
      if (event.keyCode !== 13) return
      
      this.$router.push(`/search?q=${encodeURI(this.searchWord)}`)
    }
  }
}
</script>