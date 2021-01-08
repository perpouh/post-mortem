<template>
  <div class="comment">
    <div class="comment-header">
      <img :src="comment.user.profile_image" class="commenter-image">
      {{comment.user.username}} commented on 31 Jan
      <span>...</span>
    </div>
    <div class="comment-body markdown-body" v-html="decorate(comment.body)"></div>
    <div class="comment-footer">
      <div class="liked" @click="like(comment.id)"><font-awesome-icon icon="thumbs-up" /> {{comment.liked}}</div>
    </div>
  </div>
</template>

<script>
import MarkdownIt from 'markdown-it';
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
export default{
  props: ['comment'],
  methods: {
    decorate(plaintext){
      let md = new MarkdownIt(); // TODO: これなんとかならんか
      return md.render(plaintext);
    },
  }
}
</script>