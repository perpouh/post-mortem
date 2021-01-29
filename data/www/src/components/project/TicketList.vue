<template>
  <layout tab="ticket">
    <ticket-list :tickets="tickets" :project_id="project_id"></ticket-list>
    <button class="btn btn-primary" @click="page++">押す</button>
  </layout>
</template>

<script>
import Layout from '../layouts/ProjectLayout'
import TicketList from '../parts/TicketList'
export default {
  data(){
    return {
      tickets: [],
      project_id: null,
      page: 1
    }
  },
  components: {
    Layout,
    TicketList
  },
  created(){
    this.fetchData()
  },
  watch: {
    '$route': 'fetchData',
    'page': 'fetchData'
  },
  methods: {
    fetchData () {
      this.project_id = this.$route.params.id
      this.$http.get(`/projects/${this.project_id}/tickets`,{params: {page: this.page}})
      .then(function(res){
        this.tickets = res.data.tickets
      }.bind(this))
    }
  }
}
</script>