import { createRouter, createWebHistory } from "vue-router";
// import IndexAdmin from "./view/admin/index";
// import LoadCategory from "./view/admin/category/cateLoad";
// import AddCategory from "./view/admin/category/cateAdd";
import Home from "./view/home";
const routes = [{
        path: "/",
        name: "Home",
        component: Home,
    },

    // {
    //     path: "/admin",
    //     name: "IndexAdmin",
    //     component: IndexAdmin,
    // },
    // {
    //     path: "/admin/category",
    //     name: "cateLoad",
    //     component: LoadCategory,
    // },
    // {
    //     path: "/admin/category/add",
    //     name: "cateAdd",
    //     component: AddCategory,
    // },
];
const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes,
});

export default router;