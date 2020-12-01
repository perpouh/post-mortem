<template>
  <layout>
    <div class="flex">
      <div class="sidebar">
        <img :src="user.image">
        {{user.name}}
        {{user.profile}}
        <h2>参加プロジェクト一覧</h2>
        <ul>
          <li></li>
        </ul>
      </div>
      <div class="main">
        <div>
          <div>
            <h2></h2>
          </div>
        </div>
        <div>
          <h2>活動履歴</h2>
          <ul>
            <li></li>
          </ul>
        </div>
      </div>
    </div>
  </layout>
</template>