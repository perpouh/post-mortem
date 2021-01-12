<template>
  <div class="ticket-list">
    <div class="list-header">
      <router-link :to="`/project/${project_id}/ticket/new`" class="btn-primary" v-if="!!project_id">作成</router-link>
    </div>
    <div class="list-body">
      <ul>
        <li class="row" v-for="ticket in tickets" :key="ticket.id" :class="ticket.opinion_type">
          <div class="ticket-body">
            <router-link :to="`/project/${ticket.project_id}/ticket/${ticket.id}`" class="ticket-title">{{ticket.title}}</router-link>
          </div>
          <div class="ticket-footer">
            <router-link :to="`/project/${ticket.project_id}`" v-if="!project_id" class="">{{ticket.project_name}}</router-link>&nbsp;
            <span class="">Last Update:{{ticket.updated_at}}</span>
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
  },
  components: {FontAwesomeIcon}
}
</script>