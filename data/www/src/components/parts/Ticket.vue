<template>
  <li class="ticket">
    <div class="title">プロジェクト名</div>
    <div class="badge keep"></div>
    <div class="summary">サマリサマリサマリサマリサマリサマリサマリサマリサマリサマリサマリサマリサマリサマリサマリサマリサマリサマリサマリサマリサマリサマリサマリサマリサマリサマリサマリサマリサマリサマリ</div>
    <div>
      <span class="tag">#Rails</span><span class="tag">#Vue</span>
      <span><font-awesome-icon icon="fa-comment-alt"></font-awesome-icon>0</span>
      <span><font-awesome-icon icon="fa-thumbs-up"></font-awesome-icon>12</span>
    </div>
  </li>
</template>

<script>
export default{
  // props:['ticket', 'project']
}
</script>

<style lang="scss">
.ticket{
  background-color: white;
  box-shadow: 0 0 4px 0px rgba(0,0,0,.1);
  padding: 16px;
  .title{
    color: #666;
  }
  .tag{
    color: #666;
  }
}
</style>