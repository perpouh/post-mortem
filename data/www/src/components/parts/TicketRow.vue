<template>
  <li class="ticket" @click="gotoDetail">
    <div class="ticket-header">
      <div class="title">プロジェクト名</div><!-- TODO: デザイン -->
      <div class="badge keep"></div>
    </div>
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
  props:['ticket', 'project'],
  methods: {
    gotoDetail(){
      this.$router.push(`/project/${this.project.id}/ticket/${this.ticket.id}`);
    }
  }
}
</script>