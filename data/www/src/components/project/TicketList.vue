<template>
  <layout tab="ticket">
    <ticket-list :tickets="tickets" :project_id="project_id"></ticket-list>
    <paginator :paginator="paginator" :page="page" @paging="page=$event" />
  </layout>
</template>

<script>
import Layout from '../layouts/ProjectLayout'
import Paginator from'../parts/Paginator'
import TicketList from '../parts/TicketList'
export default {
  data(){
    return {
      tickets: [],
      project_id: null,
      page: 1,
      paginator: {} // TODO: ネーミングが最悪
    }
  },
  components: {
    Layout,
    TicketList,
    Paginator
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
        this.paginator = res.data.paginator
      }.bind(this))
    }
  }
}
</script>