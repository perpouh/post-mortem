const initialState = () => {
  return {
    access_token: null,
    client: null,
    uid: null,
    account_type: null,
    plan: null,
    roles: null,
    userId: null,
  }
}

export default {
  namespaced: true,
  state: initialState(),
  mutations: {
    reset(state){
      Object.assign(state, initialState())
    },
    login: function(state, data){
      state.access_token = data.access_token;
      state.client = data.client;
      state.uid = data.uid;
      state.account_type = data.user.account_type;
      state.plan = data.plan;
      state.roles = data.roles;
      state.userId = data.user.id;
    },
    logout: function(state){
      state.access_token = null;
      state.client = null;
      state.uid = null;
      state.account_type = null;
      state.plan = null;
      state.roles = null;
      state.userId = null
    },
    userSession: function(state, data){
      if(data.roles){
        state.roles = data.roles
      }
    },
    refreshAccessToken: function(state, data){
      state.access_token = data.access_token;
    }
  },

}