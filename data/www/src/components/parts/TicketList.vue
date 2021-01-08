<template>
  <div class="ticket-list">
    <div class="list-header">ここに並び替えとか絞り込みとか</div>
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
  props: ['tickets'],
  data(){
    return {
    }
  },
  components: {
    TicketRow
  }
}
</script>