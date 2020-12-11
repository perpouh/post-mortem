<template>
  <div class="comment">
    <div class="comment-header"></div>
    <div class="comment-body markdown-body" v-html="decorate(comment.body)"></div>
    <div class="comment-footer">
      <img :src="comment.user.image" class="commenter-image">
      <span class="commenter-name">{{comment.user.username}}</span>
      <div class="liked" @click="like(comment.id)">{{comment.liked}}</div>
    </div>
  </div>
</template>

<script>
import MarkdownIt from 'markdown-it';
export default{
  props: ['comment'],
  methods: {
    decorate(plaintext){
      let md = new MarkdownIt();
      return md.render(plaintext);
    },
  }
}
</script>