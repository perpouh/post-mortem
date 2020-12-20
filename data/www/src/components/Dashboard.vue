<template>
  <layout>
    <div>
      <ul class="tab-header">
        <li class="tab" :class="{active: newer}" @click="tab='newer'">新着チケット</li>
        <li class="tab" :class="{active: active}" @click="tab='active'">アクティブ</li>
        <li class="tab" :class="{active: mention}" @click="tab='mention'">メンション</li>
      </ul>
      <div id="newer" class="tab-body" v-show="newer">
        <h2>新しく登録されたチケット</h2>
        <ticket-list :tickets="tickets"></ticket-list>
      </div>
      <div id="active" class="tab-body" v-show="active">
        <h2>新しくコメントがついたチケット</h2>
      </div>
      <div id="mention" class="tab-body" v-show="mention">
        <h2>メンションされたチケット</h2>
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
    mention: function(){
      return this.tab == 'mention'
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
    '$route': 'fetchData'
  },
  methods: {
    fetchData () {
      // this.$http.get("/my/projects")
      // .then(function(res){
      //   this.projects = res.data
      // }.bind(this))
    }
  }
}
</script>