<template>
  <ul class="projects">
    <li class="project" v-for="project in projects" v-bind:key="project.id" @click="gotoProjectDetail(project.id)">
      <h3>{{project.name}}</h3>
      <div>
        <span>メンバー 10人</span><span>#Rails #Vue #Docker</span>
      </div>
      <div>
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

<style lang="scss">
  .project{
    box-shadow: 0 0 0px 1px rgba(0,0,0,.2);
    padding: 12px 24px;
    border-radius: 4px;
    cursor: pointer;
    transition-duration: .3s;
    &:not(:first-of-type){
      margin-top: 24px;
    }
    &:hover{
      box-shadow: 0px 0px 10px 1px rgba(0,0,0,.2);
    }
  }
</style>