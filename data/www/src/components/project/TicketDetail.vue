<template>
  <layout>
    <ticket :ticket="ticket"></ticket>
    <div class="comments">
      <comment v-for="comment in comments" :key="comment.id" :comment="comment"></comment>
      <auto-scale-text-area @send="sendComment"></auto-scale-text-area>
    </div>
  </layout>
</template>

<script>
import Layout from '../layouts/ProjectLayout';
import AutoScaleTextArea from '../parts/AutoScaleTextArea.vue';
import Ticket from '../parts/Ticket';
import Comment from '../parts/Comment';
export default{
  components: {
    Layout,
    AutoScaleTextArea,
    Ticket,
    Comment
  },
  data(){
    return {
      ticket: null,
      comments: []
    }
  },
  created(){
    this.fetchData()
  },
  watch: {
    '$route': 'fetchData'
  },
  methods: {
    fetchData () {
      this.$http.get(`/projects/${this.$route.params.project_id}/tickets/${this.$route.params.id}`)
      .then(function(res){
        console.log(res)
        this.ticket = res.data.ticket
        this.comments  =res.data.ticket.comments
      }.bind(this))
    },
    sendComment(body) {
      let loader = this.$loading.show();
      this.$http.post(`/projects/${this.$route.params.project_id}/tickets/${this.$route.params.id}/comments`, {
        comment: {
          body: body
        }
      }).then(function(res){
        this.$toasted.global.success()
        location.reload()
      }.bind(this))
      .catch(function (error) {
        this.$toasted.global.error({message: error.data.message})
      }.bind(this))
      .then(function(){
        loader.hide()
      })
    }
  }
}
</script>