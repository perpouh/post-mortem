<template>
  <layout tab="setting">
    <dl class="contents">
      <dt>Project Name</dt>
      <dd><input type="text" placeholder="日本語での登録が可能です。" v-model="project.name"></dd>
      <dt>Backlog URL<small>BacklogのプロジェクトURLを登録すると、Backlogの情報からメンバー一覧を取得することができます。</small></dt>
      <dd><input type="url" placeholder="https://subdomain.backlog.jp/projects/project-code" v-model="project.backlog_url"></dd>
      <dt>Repository URL<small>任意。あとからプロジェクトを見返すときに便利です。</small></dt>
      <dd><input type="url" v-model="project.repository_url"></dd>
      <dt>Jira URL<small>任意。あとからプロジェクトを見返すときに便利です。</small></dt>
      <dd><input type="url" v-model="project.jira_url"></dd>
      <dt>Confluence URL<small>任意。あとからプロジェクトを見返すときに便利です。</small></dt>
      <dd><input type="url" v-model="project.confluence_url"></dd>
      <dt></dt>
      <dd><button class="btn-primary" @click="send">送信</button></dd>
    </dl>
  </layout>
</template>

<script>
import Layout from '../layouts/ProjectLayout'
export default{
  components: {Layout},
  data(){
    return {
      project: {
        name: "",
        backlog_url: "",
        repository_url: "",
        jira_url: "",
        confluence_url: ""
      }
    }
  },
  created(){
    this.fetchData()
  },
  watch: {
    '$route': 'fetchData',
  },
  methods: {
    fetchData () {
      this.$http.get(`/projects/${this.$route.params.id}`, {})
      .then(function(res){
        this.project = res.data.project
      }.bind(this))
    },
    send(){
      let loader = this.$loading.show();
      this.$http.post(`/project/${this.$route.params.id}`, {project: this.project})
      .then(function(res){
        this.$toasted.global.success()
        this.$router.push(`/project/${res.data.created}`)
      }.bind(this))
      .catch(function (error) {
        this.$toasted.global.error({message: error.data.message})
      }.bind(this))
      .then(function(){
        loader.hide()
      })
    }
  }
}
</script>