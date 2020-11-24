<template>
  <p>ねこ</p>
</template>

<script>
import axios from 'axios'
export default{
  name: 'ProjectList',
  created(){
    this.fetchData()
  },
  watch: {
    // ルートが変更されたらこのメソッドを再び呼び出します
    '$route': 'fetchData'
  },
  methods: {
    fetchData () {
      // this.parents = [{id: 1, name:"がじゃりこ", company:"Calbee", children:[{id:1, name:"じゃがりこbits", price: 110},{id:2, name:"じゃがりこLサイズ", price: 135}]}]
      axios.get("http://localhost:3000/projects")
      .then(function(res){
        //vueにバインドされている値を書き換えると表示に反映される
        // app.result = res.data
        console.log(res)
      })
    }
  }
}
</script>