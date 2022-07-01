<template>
    <div class="statbox widget box box-shadow">

        <div class="widget-header">
            <div class="row">
                <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                    <h4>Sửa Danh Mục</h4>
                </div>
            </div>
        </div>
        <div class="widget-content widget-content-area">
            <form method="post" v-on:submit.prevent="onSubmitEditForm" v-if="categorys">
                <input type="hidden" v-model="categorys.id">
                <div class="form-group row mb-4">
                    <label for="exampleFormControlInput1" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Mã</label>
                    <div class="col-xl-6 col-lg-6 col-sm-6">
                        <input type="text" class="form-control" id="code" placeholder="" v-model="categorys.code" />
                    </div>

                </div>
                <div class="form-group row mb-4">
                    <label for="hPassword" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Tên
                        Danh Mục</label>
                    <div class="col-xl-6 col-lg-6 col-sm-6">
                        <input type="text" class="form-control" id="name" placeholder="" v-model="categorys.name">
                    </div>
                </div>
                <div class="form-group row mb-4">
                    <label for="hPassword" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Mô tả</label>
                    <div class="col-xl-6 col-lg-6 col-sm-6">
                         <textarea class="form-control mb-4" rows="3" id="description" v-model="categorys.description"
                            ></textarea>
                    </div>
                </div>
                <fieldset class="form-group mb-4">
                    <div class="row">
                        <label class="col-form-label col-xl-2 col-sm-3 col-sm-2 pt-0">Trạng
                            Thái</label>
                        <div class="col-xl-10 col-lg-9 col-sm-10">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" v-model="categorys.status" value="true"
                                    id="status" style="width: 16px;height: 16px;" />
                                <label class="form-check-label" for="flexCheckDefault"> Hiển Thị
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" v-model="categorys.status" value="false"
                                    id="status" style="width: 16px;height: 16px;" />
                                <label class="form-check-label" for="flexCheckChecked"> Ẩn </label>
                            </div>
                        </div>
                    </div>
                </fieldset>

                <div class="form-group row">
                    <div class="col-sm-10">
                        <button type="submit" class="btn btn-primary mt-3">Lưu</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</template>
<script>
import CategoryService from '@/services/CategoryService';

export default {
    props: ['category'],
    data() {
        return {
            categorys: this.category,

        }
    },
    methods: {
        onSubmitEditForm() {
            CategoryService.update(this.categorys)
                .then((res) => {
                    //Perform Success Action
                    // this.categorys = res.data;
                    // res.data.files;
                    console.log(res);

                })
                .catch((error) => {
                    // error.response.status Check status code
                    console.log(error);
                })
                .finally(() => {
                    //Perform action in always
                });
            this.$emit("ShowEditData", this.categorys);
        },

    }

}
</script>
