<template>
  <div class="wrapper">
    <ul class="tab-header">
      <li class="tab" :class="{ active: write }" @click="tab = 'write'">
        Write
      </li>
      <li class="tab" :class="{ active: preview }" @click="tab = 'preview'">
        Preview
      </li>
    </ul>
    <div id="write" class="tab-body" v-show="write">
      <textarea
        ref="adjust_textarea"
        data-preview="#preview"
        :placeholder="placeholder"
        :class="cls"
        @change="adjustHeight"
        @keyup="adjustHeight"
        @paste="adjustHeight"
        v-model="body"
      ></textarea>
    </div>
    <div id="preview" class="tab-body markdown-body" v-show="preview">
      <div id="preview"></div>
    </div>
    <button v-on:click="send()" class="btn-primary">送信</button>
  </div>
</template>

<script>
import TextareaMarkdown from "textarea-markdown";
export default {
  data(){
    return {
      tab: 'write',
      body: ""
    }
  },
  props: ["cls", "placeholder"],
  computed: {
    write: function(){
      return this.tab == 'write';
    },
    preview: function(){
      return this.tab == 'preview'
    }
  },
  methods: {
    adjustHeight() {
      const textarea = this.$refs.adjust_textarea;
      const resetHeight = new Promise(function (resolve) {
        resolve((textarea.style.height = "auto"));
      });
      resetHeight.then(function () {
        textarea.style.height = textarea.scrollHeight + "px";
      });
    },
    send(){
      this.$emit('send', this.body)
    }
  },
  mounted() {
    let textarea = document.querySelector("textarea");
    new TextareaMarkdown(textarea);
  },
};
</script>