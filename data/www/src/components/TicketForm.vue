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
      this.$http.post(this, `/projects/${this.$route.params.id}/tickets`, {ticket: this.ticket})
    }
  }
}
</script>