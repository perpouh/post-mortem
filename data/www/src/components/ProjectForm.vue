<template>
  <layout>
    <div class="contents fetch_url">
      <h2>URLから読み込む</h2>
      <input type="url" v-model="url" placeholder="https://~~"><br />
      <p>Backlog/Jira/ほげ/ふが<!-- TODO: APIキーがあるかどうかで出し分けとかしたい --></p>
      <button type="button" class="btn btn-primary" @click="fetch">読み込む</button>
    </div>
    <dl class="contents">
      <dt>プロジェクト名</dt>
      <dd><input type="text" placeholder="日本語での登録が可能です。" v-model="project.name"></dd>
      <dt>概要</dt>
      <dd><textarea v-model="project.summary"></textarea></dd>
    </dl>
    <div class="contents">
    <h3>メンバー</h3>
      <ul>
        <li v-for="member in project.members" :key="member.id">{{member.name}} {{member.email}}</li>
      </ul>
    </div>

    <input type="text" autocomplete="on" list="users">
    <datalist id="users">
      <option>ゆうすけ</option><!-- TODO: ユーザー一覧から取得 -->
      <option>たかし</option>
    </datalist>
    <button class="btn-primary" @click="send">送信</button>
  </layout>
</template>

<script>
import Layout from './layouts/Layout'
export default{
  components: {Layout},
  data(){
    return {
      project: {
        name: "",
        summary: "",
        members_attributes: []
      },
      url: "",
      members: []
    }
  },
  methods: {
    fetch(){
      let loader = this.$loading.show();
      this.$http.get(`/project/fetch`, {
        params: {'url': this.url}
      })
      .then(function(res){
        this.$toasted.global.success()
        this.project = res.data.project
        this.members = res.data.project.members
        this.project.members_attributes = res.data.project.members.map(member => {return {'user_id' : member.user_id}})
      }.bind(this))
      .catch(function (error) {
        this.$toasted.global.error({message: error.data.message})
      }.bind(this))
      .then(function(){
        loader.hide()
      })
    },
    send(){
      let loader = this.$loading.show();
      this.$http.post(`/projects`, {project: this.project})
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