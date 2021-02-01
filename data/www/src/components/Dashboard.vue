<template>
  <layout>
    <div class="tab primary">
      <div class="tab-header">
        <ul class="contents">
          <li class="tab" :class="{active: newer}" @click="tab='newer'">新着チケット</li>
          <li class="tab" :class="{active: active}" @click="tab='active'">アクティブ</li>
          <li class="tab" :class="{active: mentioned}" @click="tab='mentioned'">メンション</li>
          <li class="tab" :class="{active: bookmark}" @click="tab='bookmark'">ブックマーク</li>
        </ul>
      </div>
      <div id="newer" class="tab-body contents" v-show="newer">
        <ticket-list :tickets="tickets"></ticket-list>
        <paginator :paginator="paginator" :page="page" @paging="page=$event" />
      </div>
      <div id="active" class="tab-body contents" v-show="active">
        <ticket-list :tickets="tickets"></ticket-list>
        <paginator :paginator="paginator" :page="page" @paging="page=$event" />
      </div>
      <div id="mentioned" class="tab-body contents" v-show="mentioned">
        <opinion-list :opinions="opinions" highlight=""></opinion-list>
        <paginator :paginator="paginator" :page="page" @paging="page=$event" />
      </div>
      <div id="bookmark" class="tab-body contents" v-show="bookmark">
        <opinion-list :opinions="opinions" highlight=""></opinion-list>
        <paginator :paginator="paginator" :page="page" @paging="page=$event" />
      </div>
    </div>
  </layout>
</template>

<script>
import Layout from './layouts/Layout'
// import ProjectList from './parts/ProjectList'
import Paginator from'./parts/Paginator'
import TicketList from './parts/TicketList'
import OpinionList from './parts/OpinionList'
export default{
  data(){
    return {
      tab: 'newer',
      tickets: [],
      page: 1,
      paginator: {} // TODO: ネーミングが最悪
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
    TicketList,
    Paginator,
    OpinionList
  },
  created(){
    this.fetchData()
  },
  watch: {
    '$route': 'fetchData',
    'tab': 'fetchData',
    'page': 'fetchData'
  },
  methods: {
    fetchData () {
      this.$http.get(`/my/tickets/${this.tab}`,{params: {page: this.page}})
      .then(function(res){
        this.tickets = res.data.tickets
        this.opinions = res.data.opinions
        this.paginator = res.data.paginator
      }.bind(this))
    }
  }
}
</script>