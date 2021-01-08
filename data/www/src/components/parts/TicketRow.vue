<template>
  <li class="row" :class="ticket.opinion_type" @click="gotoDetail">
    <div class="ticket-body">
      <div class="ticket-title">{{ticket.title}}</div>
      <div class="ticket-last-update">Last Update:{{ticket.updated_at}}</div>
    </div>
    <div class="commented"><font-awesome-icon icon="comment-alt" /> {{ticket.commented}}</div>
    <div class="liked"><font-awesome-icon icon="thumbs-up" /> {{ticket.liked}}</div>
  </li>
</template>

<script>
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
export default{
  props:['ticket', 'project_id'],
  methods: {
    gotoDetail(){
      this.$router.push(`/project/${this.project_id}/ticket/${this.ticket.id}`);
    }
  },
  components: {FontAwesomeIcon}
}
</script>