<template>
  <div class="ticket-list">
    <div class="list-header">
      <router-link :to="`/project/${project_id}/ticket/new`" class="btn-primary" v-show="!!project_id">作成</router-link>
    </div>
    <div class="list-body">
      <ul>
        <li class="row" v-for="ticket in tickets" :key="ticket.id" :class="ticket.opinion_type" @click="gotoDetail(ticket.id)">
          <div class="ticket-body">
            <div class="ticket-title">{{ticket.title}}</div>
            <div class="ticket-last-update">Last Update:{{ticket.updated_at}}</div>
          </div>
          <div class="commented"><font-awesome-icon icon="comment-alt" /> {{ticket.commented}}</div>
          <div class="liked"><font-awesome-icon icon="thumbs-up" /> {{ticket.liked}}</div>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
export default{
  props: ['tickets', 'project_id'],
  data(){
    return {
      opinion_type: ''
    }
  },
  methods: {
    gotoDetail(ticket_id){
      this.$router.push(`/project/${this.$route.params.id}/ticket/${ticket_id}`);
    }
  },
  components: {FontAwesomeIcon}
}
</script>