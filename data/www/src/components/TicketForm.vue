<template>
  <layout>
    <form>
      <div>
        <div class="toggle_radio">
          <input type="radio" id="keep" value="keep" v-model="ticket.opinion_type">
          <label for="keep" class="keep">keep</label>
          <input type="radio" id="problem" value="problem" v-model="ticket.opinion_type">
          <label for="problem" class="problem">Problem</label>
          <input type="radio" id="try" value="try" v-model="ticket.opinion_type">
          <label for="try" class="try">Try</label>
        </div>
        <button class="btn-primary">テンプレート</button>
      </div>
      <auto-scale-text-area @send="sendTicket" :placeholder="placeholder"></auto-scale-text-area>
    </form>
  </layout>
</template>

<script>
import Layout from './Layout'
import AutoScaleTextArea from './parts/AutoScaleTextArea'
export default{
  name: 'TicketForm',
  data(){
    return {
      ticket: {
        body: "",
        opinion_type: 'keep'
      },
      placeholder: "チケットには #ハッシュタグ をつけることができます。 #Rails #Docker #設計",
      template: ""
    }
  },
  components: {
    Layout,
    AutoScaleTextArea
  },
  methods: {
    send: function(){
      let loader = this.$loading.show({
        // Optional parameters
        container: null,
        canCancel: false,
      });

      this.$http.post(`/projects/${this.$route.params.project_id}/tickets`)({ticket: this.ticket})
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
    },
    sendTicket(body) {
      alert(body)
      // TODO
    }
  }
}
</script>