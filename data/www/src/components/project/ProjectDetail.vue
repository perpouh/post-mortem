<template>
  <layout tab="summary">
    <div class="flex">
      <opinion-list :opinions="opinions" highlight=""></opinion-list>
      <div>
        <div class="graph">
          KPTの量とか割合とか凡例とか
        </div>
        <div class="graph">
          タグ別のKPTの量とか割合とか凡例とか
        </div>
      </div>
    </div>
  </layout>
</template>

<script>
import Layout from '../layouts/ProjectLayout'
import OpinionList from '../parts/OpinionList.vue'
export default {
  data(){
    return {
      project_id: null,
      opinions: []
    }
  },
  components: {
    Layout,
    OpinionList,
  },
  computed: {

  },
  created(){
    this.fetchData()
  },
  watch: {
    '$route': 'fetchData'
  },
  methods: {
    fetchData () {
      this.project_id = this.$route.params.id
      this.$http.get(`/projects/${this.project_id}/opinions`)
      .then(function(res){
        this.opinions = res.data
      }.bind(this))
    }
  }
}
</script>
<style lang="scss" scoped>
.flex{
  display: flex;
  .ticket-list{
    width: 70%;
  }
}
</style>