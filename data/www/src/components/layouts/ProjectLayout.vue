<template>
  <div>
    <header>
      <a href="/" class="bland"
        ><img src="https://placehold.jp/150x50.png"
      /></a>
      <select v-model="selectedProject">
        <option
          v-for="project in projects"
          v-bind:key="project.id"
          :value="project.id"
        >
          {{ project.name }}
        </option>
      </select>
      <input type="search" v-model="searchWord" v-on:keydown.enter="submit" />
    </header>
    <main>
      <div class="tab primary">
        <div class="tab-header">
          <h2>プロジェクト名</h2>
          <p>プロジェクトの簡単な説明</p>
          <ul>
            <li class="tab" :class="{ active: summary }" @click="tab = 'summary'">
              サマリ
            </li>
            <li class="tab" :class="{ active: ticket }" @click="tab = 'ticket'">
              チケット
            </li>
            <li class="tab" :class="{ active: setting }" @click="tab = 'setting'">
              設定
            </li>
          </ul>
        </div>
        <div class="tab-body contents">
          <slot />
        </div>
      </div>
    </main>
    <footer>©2020 Perpouh.inc.</footer>
  </div>
</template>

<script>
export default {
  name: "ProjectLayout",
  components: {
  },
  data() {
    return {
      tab: "ticket",
      projects : [],
      selectedProject: "",
      searchWord: ""
    };
  },
  computed: {
    summary: function () {
      return this.tab == "summary";
    },
    ticket: function () {
      return this.tab == "ticket";
    },
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