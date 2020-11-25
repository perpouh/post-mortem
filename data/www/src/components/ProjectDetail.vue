<template>
  <layout>
    <div>
      <h2>新着チケット</h2>
      <ul>
        <li v-for="ticket in tickets" v-bind:key="ticket.id">{{ticket.body}}</li>
      </ul>
      <a href="#">>チケット一覧</a>
    </div>
    <div>
      <h2>メンバー一覧</h2>
      <ul>
        <li></li>
      </ul>
    </div>
  </layout>
</template>

<script>
import Layout from './Layout'
export default {
  name: 'ProjectDetail',
  components: {
    Layout
  },
  data() {
    return {
      tickets: []
    }
  },
  created(){
    this.fetchData()
  },
  watch: {
    '$route': 'fetchData'
  },
  methods: {
    fetchData () {
      let projId = this.$route.params.id
      this.$http.get(`/projects/${projId}/tickets`)()
      .then(function(res){
        this.tickets = res.data
      }.bind(this))
    }
  }
}
</script>