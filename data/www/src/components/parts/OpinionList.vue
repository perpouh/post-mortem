<template>
    <div class="ticket-list">
      <div class="list-header">
      </div>
      <div class="list-body">
        <ul>

          <li class="row" v-for="opinion in opinions" :key="opinion.id" :class="opinion.opinion_type">
            <div class="ticket-body">
              <router-link :to="`/project/${opinion.project_id}/ticket/${opinion.id}`" class="ticket-title">
                <text-highlight :queries="highlight">{{opinion.body}}</text-highlight>
              </router-link>
            </div>
            <div class="ticket-footer">
              <router-link :to="`/project/${opinion.project_id}`" v-if="!project_id" class="">{{opinion.project_name}}</router-link>&nbsp;
              <span class="">Last Update:{{opinion.updated_at}}</span>
            </div>
            <div class="commented" v-if="false"><font-awesome-icon icon="comment-alt" /> {{opinion.commented}}</div>
            <div class="liked"><font-awesome-icon icon="thumbs-up" /> {{opinion.liked}}</div>
          </li>

        </ul>
      </div>
    </div>
</template>

<script>
import TextHighlight from 'vue-text-highlight';
export default {
  props: ['opinions', 'highlight'],
  components: {
    TextHighlight
  }
};
</script>