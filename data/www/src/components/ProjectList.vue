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
      this.$http.get("http://localhost:3030/projects")()
      .then(function(res){
        console.log(res)
      })
    }
  }
}
</script>