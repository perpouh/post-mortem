<template>
  <layout>
    <ul>
      <li>新着</li>
      <li>アクティブ</li>
      <li>メンション</li>
    </ul>
    <div class="tickets">
      <ticket v-for="ticket in tickets" :key="ticket.id"></ticket>
    </div>
  </layout>
</template>