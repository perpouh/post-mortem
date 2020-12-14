function handleError(commit, error){
  const message = error.message || error.info.error_description;
  commit('setError', message)
}

export default{
  async login({commit},  header){
    try{
      console.log('まずここまで来てるか')
      commit('setUser', {
        access_token: header['access-token'],
        client: header['client'],
        uid: header['uid']
      });
      return true;
    }catch(e){
      handleError(commit, e);
    }finally{
      // commit('setLoading', false);
    }
  },
  async logout({commit}){
    commit('reset');
    window.localStorage.clear();
  }
}