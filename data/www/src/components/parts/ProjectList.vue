<template>
  <ul class="projects">
    <li class="project" v-for="project in projects" v-bind:key="project.id" @click="gotoProjectDetail(project.id)">
      <div class="project-body">
        <h3 class="project-name"><router-link :to="`project/${project.id}`">{{project.name}}</router-link></h3>
      </div>
      <div class="project-footer">
        <span>メンバー 10人</span>
        <span>#Rails #Vue #Docker</span>
        <span>登録日時: 2020年12月17日</span>
        <span>最終更新: 2020年12月17日</span>
      </div>
    </li>
  </ul>
</template>

<script>
export default{
  name: 'ProjectList',
  props:[ 'projects' ],
  methods: {
    gotoProjectDetail(id){
      this.$router.push(`/project/${id}`)
    }
  }
}
</script>