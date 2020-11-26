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
      let loader = this.$loading.show({
        // Optional parameters
        container: null,
        canCancel: false,
      });

      this.$http.post(`/projects/${this.$route.params.id}/tickets`)({ticket: this.ticket})
      .then(function(res){
        console.log(res)
        this.$toasted.success('チケットを作成しました', { 
          theme: "bubble", 
          position: "top-center", 
          duration : 3000
        })
        this.ticket.body = ""
        this.ticket.opinion_type = 1
      }.bind(this))
      .catch(function (error) {
        console.log(error)
        this.$toasted.error('チケットの作成に失敗しました', { 
          theme: "bubble", 
          position: "top-center", 
          duration : 3000
        })
      }.bind(this))
      .then(function(res){
        console.log(res)
        loader.hide()
      })
    }
  }
}
</script>