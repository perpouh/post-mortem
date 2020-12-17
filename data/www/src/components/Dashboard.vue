<template>
  <layout>
    <div>
      <h2>参加プロジェクト</h2>
      <project-list></project-list>
    </div>
  </layout>
</template>

<script>
import Layout from './Layout'
import ProjectList from './parts/ProjectList'
export default{
  components: {
    Layout,
    ProjectList
  }
}
</script>