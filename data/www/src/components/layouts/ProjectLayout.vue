<template>
  <div>
    <common-header />
    <main>
      <div class="tab primary">
        <div class="tab-header">
          <h2>{{ project.name }}</h2>
          <p>プロジェクトの簡単な説明</p>
          <ul>
            <li
              class="tab"
              :class="{ active: summary }"
            >
              <router-link :to="`/project/${this.$route.params.id}/summary`">サマリ</router-link>
            </li>
            <li class="tab" :class="{ active: ticket }">
              <router-link :to="`/project/${this.$route.params.id}`">チケット</router-link>
            </li>
            <li
              class="tab"
              :class="{ active: setting }"
            >
              <router-link :to="`/project/${this.$route.params.id}/setting`">設定</router-link>
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
export default {
  name: "ProjectLayout",
  components: {
    FontAwesomeIcon,
    CommonHeader,
  },
  data() {
    return {
      project: {},
    };
  },
  props: ['tab'],
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
    tab: "changeTab"
  },
  methods: {
    fetchData() {
      this.$http.get(`/projects/${this.$route.params.id}`).then(
        function (res) {
          this.project = res.data.project;
        }.bind(this)
      );
    },
    changeTab() {
      
    }
  },
};
</script>