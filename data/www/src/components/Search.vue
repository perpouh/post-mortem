<template>
  <layout>
    <h2>検索結果</h2>
    <opinion-list :opinions="opinions"></opinion-list>
  </layout>
</template>

<script>
import Layout from './layouts/Layout'
import OpinionList from './parts/OpinionList.vue'
export default{
  data(){
    return {
      opinions: [],
      q: {
        body_matches_any: "",
        opinion_type_in: []
      }
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
          'q[body_matches_any]': this.$route.query.q
        }
      })
      .then(function(res){
        this.opinions = res.data
      }.bind(this))
    }
  }
}

</script>