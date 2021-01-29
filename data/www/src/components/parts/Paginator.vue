<template>
  <div class="paginator">
    <button class="btn prev">Prev</button>
    <button class="btn">1</button>
    <button class="btn next">Next</button>
  </div>
</template>

<script>
export default{
  name: 'Paginator',
  props: [],
  computed: {
    hasNext(){
      return !this.last
    },
    hasPrev(){
      return !this.next
    }
  }
}
</script>