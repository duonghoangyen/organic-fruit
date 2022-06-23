<template>

    <div class="statbox widget box box-shadow">
        <div class="widget-header">
            <div class="row">
                <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                    <h4>Thêm Mới Banner</h4>
                </div>
            </div>
        </div>
        <div class="widget-content widget-content-area">
            <form method="post" enctype='multipart/form-data' v-on:submit.prevent="onSubmitForm">
                <div class="form-group row mb-4">
                    <label for="exampleFormControlInput1" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Mã</label>
                    <div class="col-xl-6 col-lg-6 col-sm-6">
                        <input type="text" class="form-control" id="code" placeholder="" v-model="banner.code"
                            :class="{ error: codeError.status, success: codeSuccess.status }" />
                        <p class="text-error" v-if="codeError.status">{{ codeError.text }}</p>
                        <p class="success-text" v-if="codeSuccess.status">{{ codeSuccess.text }}
                        </p>
                    </div>

                </div>
                <div class="form-group row mb-4">
                    <label for="hPassword" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Tên
                        Banner</label>
                    <div class="col-xl-6 col-lg-6 col-sm-6">
                        <input type="text" class="form-control" id="name" placeholder="" v-model="banner.name"
                            :class="{ error: nameError.status, success: nameSuccess.status }">
                        <p class="text-error" v-if="nameError.status">{{ nameError.text }}</p>
                        <p class="success-text" v-if="nameSuccess.status">{{ nameSuccess.text }}
                        </p>
                    </div>
                </div>

                <fieldset class="form-group mb-4">
                    <div class="row">
                        <label class="col-form-label col-xl-2 col-sm-3 col-sm-2 pt-0">Trạng
                            Thái</label>
                        <div class="col-xl-10 col-lg-9 col-sm-10">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" value="true" v-model="banner.status"
                                    id="status" style="width: 16px;height: 16px;"  />
                                <label class="form-check-label" for="flexCheckDefault"> Hiển Thị
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" value="false" v-model="banner.status"
                                    id="status" style="width: 16px;height: 16px;" checked/>
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
            url: null,
            ID:null,
            banner: {
                id: null,
                code: "",
                name: "",
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
        }

    },
    methods: {
        onSubmitForm() {
            if (this.banner.code.length == 0) {
                this.codeError = {
                    text: "Mã không được để trống",
                    status: true
                }

            } else if (this.banner.code.length < 4 || this.banner.code.length > 6) {
                this.codeError = {
                    text: "Mã phải từ 4 đến 6 kí tự",
                    status: true
                }


            } else if (this.banner.code.length > 4 || this.banner.code.length < 6) {
                this.codeSuccess = {
                    text: "Thành công!",
                    status: true
                }
            } else {
                this.codeError = {
                    text: "",
                    status: false
                }
            }

            if (this.banner.name.length == 0) {
                this.nameError = {
                    text: "Tên không được để trống",
                    status: true
                }

            } else if (this.banner.name.length < 6 || this.banner.name.length > 50) {
                this.nameError = {
                    text: "Tên phải từ 6 đến 50 kí tự",
                    status: true
                }


            } else if (this.banner.name.length > 6 || this.banner.name.length < 50) {
                this.nameSuccess = {
                    text: "Thành công!",
                    status: true
                }
            } else {
                this.nameError = {
                    text: "",
                    status: false
                }
            }

            if (this.codeSuccess.status == true && this.nameSuccess.status == true) {
                let formData = new FormData();
                formData.append('Images', this.banner.images);
                axios
                    .post("http://localhost:8080/Oganic_Fruit/rest/bannerService/insertBanner", this.banner, this.banner.images, {
                        headers: {
                            "Content-Type": "multipart/form-data"
                        }
                    })
                    .then((res) => {
                        //Perform Success Action
                        this.ID = res.data;
                        this.banner.id = this.ID;
                        res.data.files;
                    })
                    .catch((error) => {
                        // error.response.status Check status code
                        console.log(error);
                    })
                    .finally(() => {
                        //Perform action in always
                    });
                    this.$emit("ShowData",this.banner);
                                            
            }

        },
        handleFileUpload() {
            this.banner.images = this.$refs.images.files[0].name;
            this.url = URL.createObjectURL(this.$refs.images.files[0]);
            console.log(this.banner.images);
        }
    }

}
</script>
