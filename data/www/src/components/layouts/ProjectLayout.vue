<template>
  <div>
    <common-header />
    <main>
      <div class="tab primary">
        <div class="tab-header">
          <h2>{{ project.name }}</h2>
          <p>プロジェクトの簡単な説明</p>
          <horizontal-bar-chart />
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
import CommonHeader from "../parts/Header";
import HorizontalBarChart from "../parts/HorizontalBarChart";
export default {
  name: "ProjectLayout",
  components: {
    FontAwesomeIcon,
    CommonHeader,
    HorizontalBarChart,
  },
  data() {
    return {
      tab: "ticket",
      project: {},
    };
  },
  computed: {
    summary: function () {
      return this.tab == "summary";
    },
    ticket: function () {
      return this.tab == "ticket";
    },
    setting: function () {
      return this.tab == "setting";
    },
  },
  created() {
    this.fetchData();
  },
  watch: {
    $route: "fetchData",
  },
  methods: {
    fetchData() {
      this.$http.get(`/projects/${this.$route.params.id}`).then(
        function (res) {
          this.project = res.data.project;
        }.bind(this)
      );
    },
  },
};
</script>