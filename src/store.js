import { createStore } from 'vuex';
import axios from 'axios';
export const store = createStore({
    state: {
        banner: null,
    },
    mutations: {
        setBanner(state, BannerPaload) {
            state.banner = BannerPaload;
        },
    },
    actions: {
        async fetchAll({ commit }) {
            axios.get("http://localhost:8080/Oganic_Fruit/rest/bannerService/getListBanner")
                .then((res) => {
                    this.banner = res.data;
                    commit('setBanner', this.banner);
                })
                .catch((error) => {
                    console.log(error);
                })
                .finally(() => {
                    //Perform action in always
                });

        },
    },

    modules: {},
});
export default store;