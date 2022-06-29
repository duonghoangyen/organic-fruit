<template>

    <div class="statbox widget box box-shadow">
        <div class="widget-header">
            <div class="row">
                <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                    <h4>Thêm Mới Sản Phẩm</h4>
                </div>
            </div>
        </div>
        <div class="widget-content widget-content-area">
            <form method="post" enctype='multipart/form-data' v-on:submit.prevent="onSubmitForm">
                <div class="form-group row mb-4">
                    <label for="exampleFormControlInput1" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Mã</label>
                    <div class="col-xl-6 col-lg-6 col-sm-6">
                        <input type="text" class="form-control" id="code" placeholder="" v-model="product.code"
                            :class="{ error: codeError.status, success: codeSuccess.status }" />
                        <p class="text-error" v-if="codeError.status">{{ codeError.text }}</p>
                        <p class="success-text" v-if="codeSuccess.status">{{ codeSuccess.text }}
                        </p>
                    </div>

                </div>
                <div class="form-group row mb-4">
                    <label for="hPassword" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Tên
                        Sản Phẩm</label>
                    <div class="col-xl-6 col-lg-6 col-sm-6">
                        <input type="text" class="form-control" id="name" placeholder="" v-model="product.name"
                            :class="{ error: nameError.status, success: nameSuccess.status }">
                        <p class="text-error" v-if="nameError.status">{{ nameError.text }}</p>
                        <p class="success-text" v-if="nameSuccess.status">{{ nameSuccess.text }}
                        </p>
                    </div>
                </div>
                <div class="form-group row mb-4">
                    <label for="hPassword" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Danh Mục</label>
                    <div class="col-6">
                        <select class="form-control  basic" v-model="product.categoryId" id="categoryId">
                            <option value="">Chọn Danh Mục:</option>
                            <option v-for="item in category" :key="item.id" :selected="product.categoryId === item.id"
                                v-bind:value="item.id">{{ item.name }}</option>
                        </select>
                    </div>
                </div>
                <div class="form-group row mb-4">
                    <label for="hPassword" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Mô Tả</label>
                    <div class="col-xl-6 col-lg-6 col-sm-6">
                        <textarea class="form-control mb-4" rows="3" id="textarea-copy" v-model="product.description"
                            :class="{ error: descriptionError.status, success: descriptionSuccess.status }"></textarea>
                        <p class="text-error" v-if="descriptionError.status">{{ descriptionError.text }}</p>
                        <p class="success-text" v-if="descriptionSuccess.status">{{ descriptionSuccess.text }}
                        </p>
                    </div>
                </div>
                <div class="form-group row mb-4">
                    <label for="hPassword" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Giá</label>
                    <div class="col-6">
                        <input type="number" class="form-control" id="name" placeholder="" v-model="product.price" step="100000"
                            :class="{ error: priceError.status, success: priceSuccess.status }">
                        <p class="text-error" v-if="priceError.status">{{ priceError.text }}</p>
                        <p class="success-text" v-if="priceSuccess.status">{{ priceSuccess.text }}
                        </p>
                    </div>
                </div>
                <div class="form-group row mb-4">
                    <label for="hPassword" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Giá Khuyến mãi</label>
                    <div class="col-6">
                        <input type="number" class="form-control" id="name" placeholder="" v-model="product.salePrice" step="10000">
                    </div>
                </div>
                <fieldset class="form-group mb-4">
                    <div class="row">
                        <label class="col-form-label col-xl-2 col-sm-3 col-sm-2 pt-0">Trạng
                            Thái</label>
                        <div class="col-xl-10 col-lg-9 col-sm-10">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" v-model="product.status" :value="true"
                                    id="status" style="width: 16px;height: 16px;" />
                                <label class="form-check-label" for="flexCheckDefault"> Hiển Thị
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" v-model="product.status" :value="false"
                                    id="status" style="width: 16px;height: 16px;" checked />
                                <label class="form-check-label" for="flexCheckChecked"> Ẩn </label>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <div class="form-group row mb-4">
                    <label for="hPassword" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">
                        Ảnh</label>
                    <div class="col-xl-10 col-lg-9 col-sm-10">
                        <input type="file" class="custom-file-container__custom-file__custom-file-input" ref="images"
                            name="images" id="images" @change="handleFileUpload()">

                    </div>
                    <div class="col-xl-10 col-lg-9 col-sm-10">
                        <img v-if="url" :src="url" style="width: 600px;height: 500px;margin-left: 20%;" />
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
    data() {
        return {
            category: null,
            url: null,
            ID: null,
            product: {
                id: null,
                code: "",
                name: "",
                categoryId: "",
                description: "",
                price: "",
                salePrice: "",
                images: "",
                status: ""
            },
            codeError: {
                text: "",
                status: false,
            },
            codeSuccess: {
                text: "",
                status: false,
            },
            nameError: {
                text: "",
                status: false,
            },
            nameSuccess: {
                text: "",
                status: false,
            },
            descriptionError: {
                text: "",
                status: false,
            },
            descriptionSuccess: {
                text: "",
                status: false,
            },
            priceError: {
                text: "",
                status: false,
            },
            priceSuccess: {
                text: "",
                status: false,
            },
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
        onSubmitForm() {
            if (this.product.code.length == 0) {
                this.codeError = {
                    text: "Mã không được để trống",
                    status: true
                }

            } else if (this.product.code.length < 5) {
                this.codeError = {
                    text: "Mã phải lớn hơn 4 kí tự",
                    status: true
                }


            } else if (this.product.code.length >= 5) {
                this.codeSuccess = {
                    text: "Thành công!",
                    status: true
                }
                this.codeError = {
                    text: "",
                    status: false
                }
            } else {
                this.codeError = {
                    text: "",
                    status: false
                }
            }

            if (this.product.name.length == 0) {
                this.nameError = {
                    text: "Tên không được để trống",
                    status: true
                }

            } else if (this.product.name.length < 6 || this.product.name.length > 50) {
                this.nameError = {
                    text: "Tên phải từ 6 đến 50 kí tự",
                    status: true
                }


            } else if (this.product.name.length > 6 || this.product.name.length < 50) {
                this.nameSuccess = {
                    text: "Thành công!",
                    status: true
                }
                this.nameError = {
                    text: "",
                    status: false
                }
            } else {
                this.nameError = {
                    text: "",
                    status: false
                }
            }

            if (this.product.description.length == 0) {
                this.descriptionError = {
                    text: "Tên không được để trống",
                    status: true
                }

            } else if (this.product.description.length < 6) {
                this.descriptionError = {
                    text: "Tên phải từ 6 kí tự đổ lên",
                    status: true
                }


            } else if (this.product.description.length > 6 || this.product.description.length < 50) {
                this.descriptionSuccess = {
                    text: "Thành công!",
                    status: true
                }
                this.descriptionError = {
                    text: "",
                    status: false
                }
            } else {
                this.descriptionError = {
                    text: "",
                    status: false
                }
            }

            if (this.product.price.length == 0) {
                this.priceError = {
                    text: "Giá không được để trống",
                    status: true
                }

            } else if (this.product.price < 100000) {
                this.priceError = {
                    text: "Giá phải lớn 100000đ ",
                    status: true
                }


            } else if (this.product.price >= 100000) {
                this.priceSuccess = {
                    text: "Thành công!",
                    status: true
                }
                this.priceError = {
                    text: "",
                    status: false
                }
            } else {
                this.priceError = {
                    text: "",
                    status: false
                }
            }

            if (this.codeSuccess.status == true && this.nameSuccess.status == true && this.descriptionSuccess.status == true && this.priceSuccess.status == true) {
                let formData = new FormData();
                formData.append('images', this.$refs.images.files[0]);
                axios
                    .post("http://localhost:8080/Oganic_Fruit/rest/productService/insertProduct", this.product, this.product.images, {
                        headers: {
                            "Content-Type": "multipart/form-data"
                        }
                    })
                    .then((res) => {
                        //Perform Success Action
                        this.ID = res.data;
                        this.product.id = this.ID;
                        console.log(this.product);
                        res.data.files;
                        axios
                            .post("http://localhost:8080/Oganic_Fruit/rest/uploadService/upload", formData, {
                                headers: {
                                    "Content-Type": "multipart/form-data"
                                }
                            })

                    })
                    .catch((error) => {
                        // error.response.status Check status code
                        console.log(error);
                    })
                    .finally(() => {
                        //Perform action in always
                    });
                this.$emit("ShowData", this.product);

            }

        },
        handleFileUpload() {
            this.product.images = this.$refs.images.files[0].name;
            this.url = URL.createObjectURL(this.$refs.images.files[0]);
            console.log(this.product.images);
        }
    }

}
</script>
