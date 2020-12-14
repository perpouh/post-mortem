export default{
  setUser(state, user){
    state.user = user;
  },
  reset(state){
    state.user = null;
  }
}