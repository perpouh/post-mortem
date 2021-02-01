<template>
  <div class="paginator">
    <button class="paginator__page prev" :disabled="paginator.first" @click="current_page--">Prev</button>
    <span v-if="current_page>3">...</span>
    <button class="paginator__page" v-for="page in pages" :key="page" @click="current_page=page" :class="{'current': page == current_page}">{{page}}</button>
    <span v-if="current_page<(total_pages - 3)">...</span>
    <button class="paginator__page next" :disabled="paginator.last" @click="current_page++">Next</button>
  </div>
</template>

<script>
export default{
  name: 'Paginator',
  props: [
    'paginator',
    'page'
  ],
  data(){
    return {
      current_page: 1
    }
  },
  created(){
    // TODO: これでいいのか
    this.current_page = this.page
  },
  computed: {
    pages(){
      if(this.paginator.total_count <= 5){
        // 総ページ数が5以下の場合
        return this.range(1, this.paginator.total_pages);
      }
      if(this.paginator.current_page <= 3){
        // 現ページが3以下の場合
        return this.range(1, 5);
      }
      if(this.paginator.current_page > (this.paginator.total_pages - 3)){
        // 現ページが(総ページ-2)以上の場合
        return this.range(this.paginator.total_pages - 4, this.paginator.total_pages);
      }

      return this.range(this.paginator.current_page - 2, this.paginator.current_page + 2);
    }
  },
  watch: {
    'current_page': 'emit'
  },
  methods:{
    range(start, end, step=1){
      let arr=[]
      for(var i=start;i<=end;i+=step){
        arr.push(i);
      }
      return arr;
    },
    emit() {
      this.$emit("paging", this.current_page);
    }
  }
}
</script>