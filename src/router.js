import { createRouter, createWebHistory } from "vue-router";
import IndexBanner from "./view/Banner/index";
import AddBanner from "./view/Banner/add";
import Home from "./view/home";
const routes = [{
        path: "/",
        name: "Home",
        component: Home,
    },
    {
        path: "/banner",
        name: "Index",
        component: IndexBanner,
    },
    {
        path: "/add",
        name: "Add",
        component: AddBanner,
    },

];
const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes,
});

export default router;