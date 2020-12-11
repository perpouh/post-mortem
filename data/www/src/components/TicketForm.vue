<template>
  <layout>
    <form>
      <select v-model="ticket.opinion_type">
        <option value="keep">Keep</option>
        <option value="problem">Problem</option>
        <option value="try">Try</option>
      </select>
      <textarea v-model="ticket.body" :placeholder="placeholder"></textarea>
      <button v-on:click="send()">送信</button>
    </form>
  </layout>
</template>

<script>
import Layout from './Layout'
export default{
  name: 'TicketForm',
  data(){
    return {
      ticket: {
        body: "",
        opinion_type: 1
      },
      placeholder: "チケットには #ハッシュタグ をつけることができます。 #Rails #Docker #設計",
      template: ""
    }
  },
  components: {
    Layout
  },
  methods: {
    send: function(){
      let loader = this.$loading.show();
      this.$http.post(`/projects/${this.$route.params.id}/tickets`)({ticket: this.ticket})
      .then(function(res){
        this.$toasted.global.success()
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