<template>
  <layout>
    <h2>TODO: これサマリか何かに作り直す</h2>
    <p>プロジェクトの簡単な説明</p>
    <div class="tab primary">
      <ul class="tab-header">
        <li class="tab" :class="{active: summary}" @click="tab='summary'">サマリ</li>
        <li class="tab" :class="{active: ticket}" @click="tab='ticket'">チケット</li>
        <li class="tab" :class="{active: setting}" @click="tab='setting'">設定</li>
      </ul>
      <div class="tab-body contents">
        <slot />
      </div>
    </div>
  </layout>
</template>

<script>
import Layout from './layouts/Layout'
export default {
  name: 'ProjectDetail',
  components: {
    Layout
  },
  data() {
    return {
      tab:"ticket"
    }
  },
  computed:{
    summary: function(){
      return this.tab == 'summary'
    },
    ticket: function(){
      return this.tab == 'ticket'
    }
  }
}
</script>