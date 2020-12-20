<template>
  <div class="ticket">
    <div class="ticket-header">
      <div class="badge keep">K</div>
    </div>
    <div class="ticket-body markdown-body" v-html="decorate(ticket.body)"></div>
    <div class="ticket-footer">
      <div class="liked" @click="like(ticket.id)">{{ticket.liked}}</div>
    </div>
  </div>
</template>

<script>
import MarkdownIt from 'markdown-it';
export default{
  props:['ticket'],
  methods: {
    decorate(plaintext){
      let md = new MarkdownIt();
      return md.render(plaintext);
    },
  }
}
</script>

<style lang="scss">
.ticket-list{
    border: 1px solid #e1e4e8;
    border-radius: 4px;
    .list-header{
      background-color: #f6f8fa;
    }
    .list-body{
      .ticket{
        .badge{
          height: 20px;
          width: 20px;
          border-radius: 10px;
          position: absolute;
          color: white;
          &.keep{
            background-color: green;
          }
        }
        .ticket-body{
          margin-left: 32px;
        }
        .ticket-footer{
          margin-left: 32px;
        }
      }
    }
}
</style>