<template>
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
      <ul class="nav-menu">
        <li><router-link to="/">ダッシュボード</router-link></li>
        <li><router-link to="/projects">プロジェクト一覧</router-link></li>
        <li><router-link to="/settings">個人設定</router-link></li>
      </ul>
    </header>
</template>

<script>
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
export default {
  name: "Header",
  data() {
    return {
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
  },
  methods: {
  },
};
</script>