const initialState = () => {
  return {
    access_token: null,
    client: null,
    uid: null
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
    },
    logout: function(state){
      state.access_token = null;
      state.client = null;
      state.uid = null;
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