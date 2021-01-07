<template>
  <li class="ticket" @click="gotoDetail">
    <div class="badge keep"></div>
    <div class="ticket-body markdown-body">{{ticket.body}}</div>
    <div class="ticket-footer">
      <div class="commented" v-if="false">0</div>
      <div class="liked" @click="like(ticket.id)">{{ticket.liked}}</div>
    </div>
  </li>
</template>

<script>
import MarkdownIt from 'markdown-it';
export default{
  props:['ticket', 'project_id'],
  methods: {
    gotoDetail(){
      this.$router.push(`/project/${this.project_id}/ticket/${this.ticket.id}`);
    }
  }
}
</script>