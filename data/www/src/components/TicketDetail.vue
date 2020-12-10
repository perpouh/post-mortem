<template>
  <layout>
    <div class="ticket">
      <div class="ticket-header"></div>
      <div class="ticket-body markdown-body" v-html="decorate(ticket.body)"></div>
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
        <auto-scale-text-area @send="sendComment"></auto-scale-text-area>
        <button>送信</button>
      </div>
    </div>
  </layout>
</template>

<script>
import Layout from './Layout';
import AutoScaleTextArea from './parts/AutoScaleTextArea.vue';
import MarkdownIt from 'markdown-it';
export default{
  components: {
    Layout,
    AutoScaleTextArea
  },
  data(){
    return {
      ticket: null,
      comments: []
    }
  },
  computed: {
    decorated: function(plaintext){
      return this.decorate(plaintext)
    }
  },
  created(){
    this.fetchData()
  },
  watch: {
    '$route': 'fetchData'
  },
  methods: {
    decorate(plaintext){
      let md = new MarkdownIt();
      return md.render(plaintext);
    },
    fetchData () {
      let projId = this.$route.params.project_id
      let ticketId = this.$route.params.id
      this.$http.get(`/projects/${projId}/tickets/${ticketId}`)()
      .then(function(res){
        console.log(res)
        this.ticket = res.data.ticket
        this.comments  =res.data.ticket.comments
      }.bind(this))
    },
    sendComment(body) {
      alert(body)
      // そういえばpost通信の共通化が仕掛だったのだ
    }
  }
}
</script>