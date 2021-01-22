<template>
  <div>
    <common-header />
    <main>
      <slot />
    </main>
    <footer>©2020 Perpouh.inc.</footer>
  </div>
</template>

<script>
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import CommonHeader from '../parts/Header';
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
    CommonHeader
  },
  created() {
    this.searchWord = this.$route.query.q;
  },
  watch: {
    $route: "fetchData",
  },
  methods: {},
};
</script>