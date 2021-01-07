<template>
  <layout>
    <div>
      <ul class="tab-header">
        <li class="tab" :class="{active: newer}" @click="tab='newer'">新着チケット</li>
        <li class="tab" :class="{active: active}" @click="tab='active'">アクティブ</li>
        <li class="tab" :class="{active: mentioned}" @click="tab='mentioned'">メンション</li>
      </ul>
      <div id="newer" class="tab-body" v-show="newer">
        <h2>新しく登録されたチケット</h2>
        <ticket-list :tickets="tickets"></ticket-list>
      </div>
      <div id="active" class="tab-body" v-show="active">
        <h2>新しくコメントがついたチケット</h2>
        <ticket-list :tickets="tickets"></ticket-list>
      </div>
      <div id="mentioned" class="tab-body" v-show="mentioned">
        <h2>メンションされたチケット</h2>
        <ticket-list :tickets="tickets"></ticket-list>
      </div>
    </div>
  </layout>
</template>

<script>
import Layout from './layouts/Layout'
// import ProjectList from './parts/ProjectList'
import TicketList from './parts/TicketList'
export default{
  data(){
    return {
      tab: 'newer',
      tickets: []
    }
  },
  computed:{
    newer: function(){
      return this.tab == 'newer'
    },
    active: function(){
      return this.tab == 'active'
    },
    mentioned: function(){
      return this.tab == 'mentioned'
    }
  },
  components: {
    Layout,
    // ProjectList,
    TicketList
  },
  created(){
    this.fetchData()
  },
  watch: {
    '$route': 'fetchData',
    'tab': 'fetchData'
  },
  methods: {
    fetchData () {
      this.$http.get(`/my/tickets/${this.tab}`)
      .then(function(res){
        this.tickets = res.data
      }.bind(this))
    }
  }
}
</script>