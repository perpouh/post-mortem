<template>
  <layout>
    <ul class="tab-header">
      <li class="tab" :class="{active: summary}" @click="tab='summary'">サマリ</li>
      <li class="tab" :class="{active: ticket}" @click="tab='ticket'">チケット</li>
    </ul>
    <div id="summary" class="tab-body" v-show="summary">
      <!-- <badge v-for="tag in tags" v-bind:key="tag.id"></badge> -->
      <h2>メンバー一覧</h2>
      <ul>
        <li v-for="member in members" v-bind:key="member.id">{{member.name}}</li>
      </ul>
    </div>
    <div id="ticket" class="tab-body" v-show="ticket">
      <h2>新着チケット</h2>
      <div class="card-header">
        <router-link :to="`/project/${$route.params.id}/ticket/new`" class="btn-primary">作成</router-link>
      </div>
      <ul>
        <ticket-row v-for="ticket in tickets" v-bind:key="ticket.id" :ticket="ticket" :project="project"></ticket-row>
      </ul>
    </div>
  </layout>
</template>

<script>
import Layout from './Layout'
import TicketRow from './parts/TicketRow'
export default {
  name: 'ProjectDetail',
  components: {
    Layout,
    TicketRow
  },
  data() {
    return {
      project: {},
      tickets: [],
      members: [],
      tab:"summary"
    }
  },
  created(){
    this.fetchData()
  },
  watch: {
    '$route': 'fetchData'
  },
  computed:{
    summary: function(){
      return this.tab == 'summary'
    },
    ticket: function(){
      return this.tab == 'ticket'
    }
  },
  methods: {
    fetchData () {
      let projId = this.$route.params.id
      this.$http.get(`/projects/${projId}`)()
      .then(function(res){
        this.project = res.data.project
        this.tickets = res.data.project.tickets
        this.members = res.data.project.members
      }.bind(this))
    },
    gotoDetail(ticketID){
      this.$routes.push(`/ticket/${ticketID}`)
    }
  }
}
</script>