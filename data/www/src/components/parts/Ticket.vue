<template>
  <div class="ticket">
    <div class="ticket-header">
      <div class="badge keep">K</div>
    </div>
    <div class="ticket-body markdown-body" v-html="decorate(ticket.body)"></div>
    <div class="ticket-footer">
      <div class="liked" @click="like(ticket.id)">{{ticket.liked}}</div>
    </div>
  </div>
</template>

<script>
import MarkdownIt from 'markdown-it';
export default{
  props:['ticket'],
  methods: {
    decorate(plaintext){
      let md = new MarkdownIt();
      return md.render(plaintext);
    },
  }
}
</script>