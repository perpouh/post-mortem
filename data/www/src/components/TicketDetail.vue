<template>
  <layout>
    <div class="ticket">
      {{ticket.body}}
      <div class="ticket-footer">
        <div class="liked" @click="like(ticket.id)">{{ticket.liked}}</div>
      </div>
    </div>
    <div class="comments">
      <div class="comment" v-for="comment in comments" :key="comment.id">
        {{comment.body}}
      <div class="comment-footer">
        <img :src="comment.user.image" class="commenter-image">
        <span class="commenter-name">{{comment.user.username}}</span>
        <div class="liked" @click="like(comment.id)">{{comment.liked}}</div>
      </div>
      </div>
      <div class="comment">
        <textarea></textarea>
        <button>送信</button>
      </div>
    </div>
  </layout>
</template>

<script>
import Layout from './Layout';
export default{

}
</script>