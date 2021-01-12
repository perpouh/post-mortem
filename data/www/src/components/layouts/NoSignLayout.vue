<template>
  <div>
    <header>
      <a href="/" class="bland"><img src="https://placehold.jp/150x50.png"></a>
    </header>
    <main>
      <slot />
    </main>
    <footer>
      ©2020 Perpouh.inc.
    </footer>
  </div>
</template>

<script>
export default{
  name: 'NoSignLayout'
}
</script>

<style scoped>
main{
  max-width: 1260px;
  margin: 0 auto;
}
</style>