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
      <div class="tab primary">
        <div class="tab-header">
          <h2>プロジェクト名</h2>
          <p>プロジェクトの簡単な説明</p>
          <ul>
            <li
              class="tab"
              :class="{ active: summary }"
              @click="tab = 'summary'"
            >
              サマリ
            </li>
            <li class="tab" :class="{ active: ticket }" @click="tab = 'ticket'">
              チケット
            </li>
            <li
              class="tab"
              :class="{ active: setting }"
              @click="tab = 'setting'"
            >
              設定
            </li>
          </ul>
        </div>
        <div class="tab-body contents">
          <slot />
        </div>
      </div>
    </main>
    <footer>©2020 Perpouh.inc.</footer>
  </div>
</template>

<script>
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
export default {
  name: "ProjectLayout",
  components: {
    FontAwesomeIcon,
  },
  data() {
    return {
      tab: "ticket",
      projects: [],
      selectedProject: "",
      searchWord: "",
    };
  },
  computed: {
    summary: function () {
      return this.tab == "summary";
    },
    ticket: function () {
      return this.tab == "ticket";
    },
  },
  created() {},
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