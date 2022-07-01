<template>
    <div class="main-container" id="container">
        <!--  BEGIN CONTENT AREA  -->
        <div id="content" class="main-content">
            <div class="layout-px-spacing">

                <div class="row layout-top-spacing">
                    <div id="tableProgress" class="col-lg-12 col-12 layout-spacing">

                        <div class="statbox widget box box-shadow" v-if="isShowEdit == false && isShowAdd == false">
                            <a type="submit" class="btn btn-success mt-3" v-on:click.prevent="onAdd">Thêm Mới<svg
                                    xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                    class="bi bi-plus" viewBox="0 0 16 16">
                                    <path
                                        d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                                </svg></a>
                            <div class="widget-header">
                                <div class="row">
                                    <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                                        <h4>Quản Lý Danh Mục</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="widget-content widget-content-area">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th class="text-center">Mã</th>
                                                <th>Tên</th>
                                                <th>Mô Tả</th>
                                                <th>Trạng Thái</th>
                                                <th class="text-center">Hành Động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-for="item in category" :key="item.id">
                                                <td class="text-center">{{ item.code }}</td>
                                                <td>{{ item.name }}</td>
                                                <td>{{ item.description }}</td>
                                                <td>
                                                    <p class="text-danger">
                                                        <span v-if="item.status">Hiển Thị</span>
                                                        <span v-if="!item.status">Ẩn</span>
                                                    </p>
                                                </td>
                                                <td class="text-center">
                                                    <a href="javascript:void(0);" data-toggle="tooltip"
                                                        data-placement="top" title="" data-original-title="Edit"
                                                        style="padding: 20px;" v-on:click="onEdit(item)"><svg
                                                            xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                            viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                            stroke-width="2" stroke-linecap="round"
                                                            stroke-linejoin="round" class="feather feather-edit-2">
                                                            <path
                                                                d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z">
                                                            </path>
                                                        </svg></a>
                                                    <a href="javascript:void(0);" data-toggle="tooltip"
                                                        v-on:click.stop.prevent="onDelete(item)" data-placement="top"
                                                        title="" data-original-title="Delete"><svg
                                                            xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                            viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                            stroke-width="2" stroke-linecap="round"
                                                            stroke-linejoin="round" class="feather feather-trash-2">
                                                            <polyline points="3 6 5 6 21 6"></polyline>
                                                            <path
                                                                d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
                                                            </path>
                                                            <line x1="10" y1="11" x2="10" y2="17"></line>
                                                            <line x1="14" y1="11" x2="14" y2="17"></line>
                                                        </svg></a>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <a href="" v-if="isShowEdit == true || isShowAdd == true" v-on:click.prevent="back_to"><svg
                                xmlns="http://www.w3.org/2000/svg" width="16" style="width: 32px;
                            height: 32px;" height="16" fill="currentColor" class="bi bi-arrow-left-circle-fill"
                                viewBox="0 0 16 16">
                                <path
                                    d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0zm3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z" />
                            </svg></a>
                        <CategoryEdit :category="showEdit" v-if="isShowEdit == true" @ShowEditData="getEdit($event)" />
                        <CategoryAdd v-if="isShowAdd == true" @ShowData="getData($event)" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<style>
</style>
<script>
import CategoryEdit from "../Category/edit.vue";
import CategoryAdd from "../Category/add.vue";
import CategoryService from "@/services/CategoryService";
export default {
    name: "Index",
    components: {
        CategoryEdit,
        CategoryAdd,
    },
    data() {
        return {
            category: null,
            showEdit: null,
            isShowEdit: false,
            isShowAdd: false,
        }
    },
   

    mounted() {
        CategoryService.getAll()
            .then((res) => {
                this.category = res.data;
            })
            .catch((error) => {
                console.log(error);
            })
            .finally(() => {
                //Perform action in always
            })

    },

    methods: {
        onEdit(data) {
            this.showEdit = data;
            this.isShowEdit = true
            console.log(data);
        },
        back_to() {
            this.isShowEdit = false,
                this.isShowAdd = false
        },
        onAdd() {
            this.isShowAdd = true
        },
        getData(data) {
            if (data) {
                this.category.push(data);
            }
            console.log(data);
            this.isShowAdd = false;

        },
        getEdit(data) {
            for (let i = 0; i < this.category.length; i++) {
                if (this.category[i].id == data.id) {
                    this.category[i] = data;
                    break;
                }
            }

            console.log(this.category);
            this.isShowEdit = false;
        },
        onDelete(item) {
            if (confirm("Bạn có chắc muốn xóa danh mục số " + item.id)) {
                console.log(item.id);
                CategoryService.delete(item.id)
                    .then(response => {
                        console.log(response);
                        this.category
                            .splice(this.category.findIndex(e => e.id == item.id), 1)
                            .push(response.data);
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            }
        }
    }

}
</script>