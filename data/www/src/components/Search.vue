<template>
  <layout>
    <h2>検索結果</h2>
    <div class="contents">
      <opinion-list :opinions="opinions" :highlight="searchWords"></opinion-list>
      <paginator :paginator="paginator" :page="page" @paging="page=$event" />
    </div>
  </layout>
</template>

<script>
import Layout from './layouts/Layout'
import OpinionList from './parts/OpinionList.vue'
import Paginator from'./parts/Paginator'
export default{
  data(){
    return {
      opinions: [],
      q: {
        body_matches_all: "",
        opinion_type_in: []
      },
      paginator: {},
      page: 1
    }
  },
  components: {
    Layout,
    OpinionList,
    Paginator
  },
  watch: {
    '$route': 'fetchData',
    'page': 'fetchData'
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
          'q[body_matches_all]': this.$route.query.q,
          page: this.page
        }
      })
      .then(function(res){
        this.opinions = res.data.opinions
        this.paginator = res.data.paginator
      }.bind(this))
    }
  }
}

</script>