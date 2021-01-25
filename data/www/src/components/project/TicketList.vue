<template>
  <layout tab="ticket">
    <ticket-list :tickets="tickets" :project_id="project_id"></ticket-list>
  </layout>
</template>

<script>
import Layout from '../layouts/ProjectLayout'
import TicketList from '../parts/TicketList'
export default {
  data(){
    return {
      tickets: [],
      project_id: null
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
    '$route': 'fetchData'
  },
  methods: {
    fetchData () {
      this.project_id = this.$route.params.id
      this.$http.get(`/projects/${this.project_id}`)
      .then(function(res){
        // this.project = res.data.project
        this.tickets = res.data.project.tickets
        // this.members = res.data.project.members
        // this.manager = res.data.project.manager
      }.bind(this))
    }
  }
}
</script>