<template>
  <div class="ticket-list">
    <div class="list-header">
      <router-link :to="`/project/${project_id}/ticket/new`" class="btn-primary" v-show="!!project_id">作成</router-link>
    </div>
    <div class="list-body">
      <ul>
        <ticket-row v-for="ticket in tickets" :key="ticket.id" :ticket="ticket" :project_id="ticket.project_id"></ticket-row>
      </ul>
    </div>
  </div>
</template>

<script>
import TicketRow from './TicketRow';
export default{
  props: ['tickets', 'project_id'],
  data(){
    return {
      opinion_type: ''
    }
  },
  components: {
    TicketRow
  }
}
</script>