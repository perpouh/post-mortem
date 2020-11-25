<template>
  <p>ねこ</p>
</template>

<script>
export default{
  name: 'ProjectList',
  created(){
    this.fetchData()
  },
  watch: {
    '$route': 'fetchData'
  },
  methods: {
    fetchData () {
      this.$http.get("/projects")()
      .then(function(res){
        console.log(res)
      })
    }
  }
}
</script>