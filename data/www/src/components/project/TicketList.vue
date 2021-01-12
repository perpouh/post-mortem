<template>
  <layout>
    <ticket-list :tickets="tickets"></ticket-list>
  </layout>
</template>

<script>
import Layout from '../layouts/ProjectLayout'
import TicketList from '../parts/TicketList'
export default {
  data(){
    return {
      tickets: []
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
      let projId = this.$route.params.id
      this.$http.get(`/projects/${projId}`)
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