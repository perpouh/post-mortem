<template>
  <div class="ticket-list">
    <div class="list-header">ここに並び替えとか絞り込みとか</div>
    <div class="list-body">
      <ul>
        <ticket v-for="ticket in tickets" :key="ticket.id" :ticket="ticket" :project_id="ticket.project_id"></ticket>
      </ul>
    </div>
  </div>
</template>

<script>
import Ticket from './TicketRow';
export default{
  props: ['tickets'],
  data(){
    return {
      ticket: {
        id: 1,
        body: "hogehoge",
        liked: 3
      }
    }
  },
  components: {
    Ticket
  }
}
</script>