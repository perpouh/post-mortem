<template>
  <div>
    <header>
      <a href="/" class="bland"
        ><img src="https://placehold.jp/150x50.png"
      /></a>
      <form class="search-form">
        <input
          type="search"
          v-model="searchWord"
          v-on:keydown.enter="submit"
          placeholder="キーワード検索"
        />
        <font-awesome-icon icon="search" class="watermark" />
      </form>
    </header>
    <main>
      <slot />
    </main>
    <footer>©2020 Perpouh.inc.</footer>
  </div>
</template>

<script>
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
export default {
  name: "Layout",
  data() {
    return {
      projects: [],
      selectedProject: "",
      searchWord: "",
    };
  },
  components: {
    FontAwesomeIcon,
  },
  created() {
    this.searchWord = this.$route.query.q;
  },
  watch: {
    $route: "fetchData",
  },
  methods: {
    submit() {
      // 日本語入力中のEnterは無視する
      if (event.keyCode !== 13) return;

      this.$router.push(`/search?q=${encodeURI(this.searchWord)}`);
    },
  },
};
</script>