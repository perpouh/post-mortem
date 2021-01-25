<template>
  <layout>
    <h2>検索結果</h2>
    <div class="contents">
      <opinion-list :opinions="opinions" :highlight="searchWords"></opinion-list>
    </div>
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
        body_matches_all: "",
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
  computed: {
    searchWords: function(){
      return this.$route.query.q.split(/\s/)
    }
  },
  methods: {
    fetchData () {
      this.$http.get("/search", {
        params:{
          'q[body_matches_all]': this.$route.query.q
        }
      })
      .then(function(res){
        this.opinions = res.data
      }.bind(this))
    }
  }
}

</script>