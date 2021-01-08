<template>
  <div class="tab">
    <ul class="tab-header">
      <li class="tab" :class="{ active: write }" @click="tab = 'write'">
        Write
      </li>
      <li class="tab" :class="{ active: preview }" @click="tab = 'preview'">
        Preview
      </li>
    </ul>
    <div id="write" class="tab-body" v-show="write">
      <mentionable :keys="['@', '#']" :items="items" offset="6" @open="onOpen">
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

        <template #no-result>
          <div class="dim">No result</div>
        </template>
        <template #item-@="{ item }">
          <div class="user">
            {{ item.value }}
            <span class="dim"> ({{ item.firstName }}) </span>
          </div>
        </template>
        <template #item-#="{ item }">
          <div class="issue">
            <span class="number"> #{{ item.value }} </span>
            <span class="dim">
              {{ item.label }}
            </span>
          </div>
        </template>
      </mentionable>
      <button v-on:click="send()" class="btn-primary" :disabled="!body">送信</button>
    </div>
    <div id="preview" class="tab-body markdown-body" v-show="preview">
      <div id="preview"></div>
    </div>
  </div>
</template>

<script>
import TextareaMarkdown from "textarea-markdown";
import { Mentionable } from "vue-mention";
export default {
  data() {
    return {
      tab: "write",
      body: "",
      items: [],
      users: [
        {
          value: 'akryum',
          firstName: 'Guillaume',
        },
        {
          value: 'posva',
          firstName: 'Eduardo',
        },
        {
          value: 'atinux',
          firstName: 'Sébastien',
        },
      ],
      issues: [
        {
          value: 123,
          label: 'Error with foo bar',
          searchText: 'foo bar'
        },
        {
          value: 42,
          label: 'Cannot read line',
          searchText: 'foo bar line'
        },
        {
          value: 77,
          label: 'I have a feature suggestion',
          searchText: 'feature'
        }
      ]
    };
  },
  props: ["cls", "placeholder"],
  computed: {
    write: function () {
      return this.tab == "write";
    },
    preview: function () {
      return this.tab == "preview";
    },
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
    send() {
      this.$emit("send", this.body);
    },
    onOpen:function (key) {
      this.items = key === '@' ? this.users : this.issues
    },
  },
  mounted() {
    let textarea = document.querySelector("textarea");
    new TextareaMarkdown(textarea);
  },
  components: {
    TextareaMarkdown,
    Mentionable
  }
};
</script>