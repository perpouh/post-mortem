<template>
  <layout>
    <form>
      <div>
        <div class="toggle_radio">
          <input type="radio" id="keep_on" value="keep_on" v-model="ticket.opinion_type">
          <label for="keep_on" class="keep_on">Keep</label>
          <input type="radio" id="problem" value="problem" v-model="ticket.opinion_type">
          <label for="problem" class="problem">Problem</label>
          <input type="radio" id="try_to" value="try_to" v-model="ticket.opinion_type">
          <label for="try_to" class="try_to">Try</label>
        </div>
        <button class="btn-primary">テンプレート</button>
      </div>
      <auto-scale-text-area @send="sendTicket" :placeholder="placeholder"></auto-scale-text-area>
    </form>
  </layout>
</template>

<script>
import Layout from './layouts/Layout'
import AutoScaleTextArea from './parts/AutoScaleTextArea'
export default{
  name: 'TicketForm',
  data(){
    return {
      ticket: {
        body: "",
        opinion_type: 'keep_on'
      },
      placeholder: "チケットには #ハッシュタグ をつけることができます。 #Rails #Docker #設計\ngitコミットメッセージと同じく、冒頭一行をタイトルとして扱います。",
      template: ""
    }
  },
  components: {
    Layout,
    AutoScaleTextArea
  },
  methods: {
    sendTicket(body) {
      this.ticket.body = body;
      let loader = this.$loading.show();
      this.$http.post(`/projects/${this.$route.params.project_id}/tickets`, {ticket: this.ticket})
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