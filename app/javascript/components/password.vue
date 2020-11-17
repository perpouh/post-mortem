<template>
  <section>
    <h2>ユーザー登録</h2>
    <form
      class="new_user"
      id="new_user"
      action="/users"
      accept-charset="UTF-8"
      method="post"
    >
      <input name="utf8" type="hidden" value="&#x2713;" /><input
        type="hidden"
        name="authenticity_token"
        value="IzBgNuW8XV9d/z8RJeEU9sQjLnlbSBZhumsgvuZ8mqdAiq/n5LsK72+qPQWZEKxqaqa209z3hvdu7gp+1+40qg=="
      />

      <div class="field">
        <label for="user_email">Eメール</label><br />
        <input
          autofocus="autofocus"
          autocomplete="email"
          type="email"
          value=""
          name="user[email]"
          id="user_email"
        />
      </div>

      <div class="field">
        <label for="user_password">パスワード</label><br />
        <password
          v-model="user.password"
          :secureLength="8"
          :toggle="true"
          :badge="false"
          @score="showScore"
          @feedback="showFeedback"
        ></password>
      </div>

      <div class="actions">
        <input
          type="submit"
          name="commit"
          value="Sign up"
          data-disable-with="Sign up"
        />
      </div>
    </form>
    <a href="/users/sign_in">Log in</a><br />
  </section>
</template>

<script>
import Password from "vue-password-strength-meter";
export default {
  data: function () {
    return {
      user: {
        email: "",
        password: ""
      }
    };
  },
  components: {
    Password,
  },
  methods: {
    showFeedback({ suggestions, warning }) {
      console.log("🙏", suggestions);
      console.log("⚠", warning);
    },
    showScore(score) {
      console.log("💯", score);
    },
  },
};
</script>

<style>
.field{
  max-width: 400px;
  margin: 0 auto;
}

input[type="email"]{
  background-color: #f1f1f1;
  border: 1px solid #f1f1f1;
  border-radius: 2px;
  box-sizing: border-box;
  font-size: 14px;
  padding: 13px;
  width: 100%;
}
</style>