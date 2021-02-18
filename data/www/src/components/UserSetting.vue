<template>
  <layout>
    <div class="contents">
      <h2>個人設定</h2>
      <dl>
        <dt>ユーザー名(/^[a-z][A-Z][0-9]\-_$/)</dt>
        <dd><input type="text" v-model="user.username" /></dd>
        <dt>表示名(日本語可)</dt>
        <dd><input type="text" v-model="user.nickname" /></dd>
      </dl>
      <button type="button" class="btn btn-primary">送信</button>
    </div>
    <div class="contents">
      <h2>アイコン変更</h2>
      <div>
        <ul class="icon-list">
          <li>
            <input type="radio" name="profile_image" id="backlog_icon" value="backlog" v-model="image_from" />
            <label class="icon-list__item" for="backlog_icon">
              <div class="icon-list__item__image__wrapper">
              <img
                class="icon-list__item__image"
                src="https://placehold.jp/120x120.png"
              />
              </div>Backlog
            </label>
          </li>
          <li>
            <input type="radio" name="profile_image" id="slack_icon" value="slack" v-model="image_from" />
            <label class="icon-list__item" for="slack_icon">
              <div class="icon-list__item__image__wrapper">
              <img
                class="icon-list__item__image"
                src="https://placehold.jp/120x120.png"
              />
              </div>Slack
            </label>
          </li>
          <li>
            <input type="radio" name="profile_image" value="local" v-model="image_from" />
            <label class="icon-list__item">
              <div class="icon-list__item__image__wrapper">
              <img
                class="icon-list__item__image"
                :src="local_image"
              />
              </div>アップロード<input type="file" id="fileinput" @change="selectImage" accept="image/*" />
            </label>
          </li>
        </ul>
      </div>
      <button type="button" class="btn btn-primary">送信</button>
    </div>
    <div class="contents">
      <h2>パスワード変更</h2>
      <dl>
        <dt>旧パスワード</dt>
        <dd><input type="password" /></dd>
        <dt>新パスワード</dt>
        <dd><input type="password" /></dd>
      </dl>
      <button type="button" class="btn btn-primary">送信</button>
      現パスワードがわからない場合:<button class="btn btn-primary">
        リセットメールを送信する
      </button>
    </div>
  </layout>
</template>

<script>
import Layout from "@/components/layouts/Layout";
export default {
  data() {
    return {
      user: {
        username: "",
        nickname: "",
      },
      image_from: "local",
      local_image: "https://placehold.jp/120x120.png"
    };
  },
  components: { Layout },
  created() {
    this.fetchData();
  },
  methods: {
    fetchData() {
      this.$http.get("/my/profile/show", {}).then(
        function (res) {
          this.user.username = res.data.username;
          this.user.nickname = res.data.nickname;
        }.bind(this)
      );
    },
    selectImage(e){
      this.image_from = "local"

      const inputImage = document.getElementById('fileinput');
      if (inputImage.files.length === 0) {
        return;
      }

      const file = inputImage.files[0];

      const reader = new FileReader();
      reader.onload = (e) => {
        this.local_image = e.target.result;
      }
      reader.readAsDataURL(file);
    }
  },
};
</script>

<style lang="scss">
.icon-list {
  list-style-type: none;
  display: flex;
  &__item {
    display: flex;
    flex-direction: column;
    padding: 8px;
    &__image {
      width: 120px;
      &__wrapper{
        border-radius: 60px;
        overflow: hidden;
      }
    }
  }
}
input[type="radio"] {
  display: none;
}
input[type="radio"]:checked + label {
    background-color: #F5DF4D;
}
</style>