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
            <form method="post" v-on:submit.prevent="onSubmitEditForm" v-if="products">
                <input type="hidden" v-model="products.id">
                <div class="form-group row mb-4">
                    <label for="exampleFormControlInput1" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Mã</label>
                    <div class="col-xl-6 col-lg-6 col-sm-6">
                        <input type="text" class="form-control" id="code" placeholder="" v-model="products.code" />
                    </div>

                </div>
                <div class="form-group row mb-4">
                    <label for="hPassword" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Danh Mục</label>
                    <div class="col-6">
                        <select class="form-control  basic" v-model="products.categoryId" id="categoryId">
                            <option v-for="item in category" :key="item.id" :selected="products.categoryId === item.id"
                                v-bind:value="item.id">{{ item.name }}</option>
                        </select>
                    </div>
                </div>
                <div class="form-group row mb-4">
                    <label for="hPassword" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Mô tả</label>
                    <div class="col-xl-6 col-lg-6 col-sm-6">
                        <textarea class="form-control mb-4" rows="3" id="description"
                            v-model="products.description"></textarea>
                    </div>
                </div>
                <div class="form-group row mb-4">
                    <label for="hPassword" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Giá</label>
                    <div class="col-6">
                        <input type="number" class="form-control" id="name" placeholder="" v-model="products.price" step="100000">
                    </div>
                </div>
                <div class="form-group row mb-4">
                    <label for="hPassword" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Giá Khuyến mãi</label>
                    <div class="col-6">
                        <input type="number" class="form-control" id="name" placeholder="" v-model="products.salePrice" step="10000">
                    </div>
                </div>
                <fieldset class="form-group mb-4">
                    <div class="row">
                        <label class="col-form-label col-xl-2 col-sm-3 col-sm-2 pt-0">Trạng
                            Thái</label>
                        <div class="col-xl-10 col-lg-9 col-sm-10">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" v-model="products.status" value="true"
                                    id="status" style="width: 16px;height: 16px;" />
                                <label class="form-check-label" for="flexCheckDefault"> Hiển Thị
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" v-model="products.status" value="false"
                                    id="status" style="width: 16px;height: 16px;" />
                                <label class="form-check-label" for="flexCheckChecked"> Ẩn </label>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <div class="form-group row mb-4">
                    <label for="hPassword" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">
                        Ảnh</label>
                    <div class="col-xl-10 col-lg-9 col-sm-10">
                        <input type="file" class="custom-file-container__custom-file__custom-file-input"
                            accept="Images/*" ref="images" id="images" @change="handleFileUpload()">

                    </div>
                    <div class="col-xl-10 col-lg-9 col-sm-10">
                        <img :src="'http://localhost:8080/Oganic_Fruit/assets/' + products.images"
                            style="width: 600px;height: 500px;margin-left: 20%;" v-if="ishowImage == false" />
                        <img v-bind:src="url" style="width: 600px;height: 500px;margin-left: 20%;"
                            v-if="ishowImage == true" />
                    </div>

                </div>

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
import axios from "axios";
export default {
    props: ['product'],
    data() {
        return {
            products: this.product,
            url: null,
            ishowImage: false,
            category:null

        }
    },
       mounted() {
        axios.get("http://localhost:8080/Oganic_Fruit/rest/categoryService/getListCategory")
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
        onSubmitEditForm() {
            let formData = new FormData();
            formData.append('images', this.$refs.images.files[0]);
            axios
                .post("http://localhost:8080/Oganic_Fruit/rest/productService/updateProduct", this.products)
                .then((res) => {
                    //Perform Success Action
                    // this.categorys = res.data;
                    // res.data.files;
                    console.log(res);
                    if (this.products.images == "") {
                        axios
                            .post("http://localhost:8080/Oganic_Fruit/rest/uploadService/upload", formData, {
                                headers: {
                                    "Content-Type": "multipart/form-data"
                                }
                            })
                    }
                })
                .catch((error) => {
                    // error.response.status Check status code
                    console.log(error);
                })
                .finally(() => {
                    //Perform action in always
                });
            this.$emit("ShowEditData", this.products);
        },
        handleFileUpload() {
            this.banners.images = this.$refs.images.files[0].name;
            this.url = URL.createObjectURL(this.$refs.images.files[0]);
            this.ishowImage = true;
        }
    }

}
</script>
