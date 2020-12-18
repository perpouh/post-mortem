<template>
    <ul>
      <li v-for="opinion in opinions" :key="opinion.id">
        {{opinion.body}}
      </li>
    </ul>
</template>

<script>
export default{
  props: ['opinions']
}
</script>