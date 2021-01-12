<template>
  <layout>
    <div class="tab primary">
      <div class="tab-header">
        <h2>ダッシュボード</h2>
        <ul>
          <li class="tab" :class="{active: newer}" @click="tab='newer'">新着チケット</li>
          <li class="tab" :class="{active: active}" @click="tab='active'">アクティブ</li>
          <li class="tab" :class="{active: mentioned}" @click="tab='mentioned'">メンション</li>
          <li class="tab" :class="{active: bookmark}" @click="tab='bookmark'">ブックマーク</li>
        </ul>
      </div>
      <div id="newer" class="tab-body contents" v-show="newer">
        <h2>新しく登録されたチケット</h2>
        <ticket-list :tickets="tickets"></ticket-list>
      </div>
      <div id="active" class="tab-body contents" v-show="active">
        <h2>新しくコメントがついたチケット</h2>
        <ticket-list :tickets="tickets"></ticket-list>
      </div>
      <div id="mentioned" class="tab-body contents" v-show="mentioned">
        <h2>メンションされたチケット</h2>
        <ticket-list :tickets="tickets"></ticket-list>
      </div>
      <div id="bookmark" class="tab-body contents" v-show="bookmark">
        <h2>ブックマーク</h2>
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
    },
    bookmark: function(){
      return this.tab == 'bookmark'
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