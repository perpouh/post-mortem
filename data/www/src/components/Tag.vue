<template>
  <layout>
    <h2>#Railsタグのついた投稿一覧</h2>
    <opinion-list :opinions="opinions"></opinion-list>
  </layout>
</template>

<script>
import Layout from './Layout'
import OpinionList from './parts/OpinionList.vue'
export default{
  data(){
    return {
      opinions: []
    }
  },
  components: {
    Layout,
    OpinionList
  },
  watch: {
    '$route': 'fetchData',
  },
  created(){
    this.fetchData()
  },
  methods: {
    fetchData () {
      this.$http.get("/search", {
        params:{
          'tag': this.$route.params.tag
        }
      })
      .then(function(res){
        this.opinions = res.data
      }.bind(this))
    }
  }
}

</script>