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
            <form method="post" enctype="multipart/form-data" v-on:submit.prevent="onSubmitForm">
                <div class="form-group row mb-4">
                    <label for="exampleFormControlInput1" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Mã</label>
                    <div class="col-xl-6 col-lg-6 col-sm-6">
                        <input type="text" class="form-control" id="code" placeholder="" v-model="banner.code"
                            :class="{ error: codeError.status, success: codeSuccess.status }" />
                        <p class="text-error" v-if="codeError.status">
                            {{ codeError.text }}
                        </p>
                        <p class="success-text" v-if="codeSuccess.status">
                            {{ codeSuccess.text }}
                        </p>
                    </div>
                </div>
                <div class="form-group row mb-4">
                    <label for="hPassword" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Tên Banner</label>
                    <div class="col-xl-6 col-lg-6 col-sm-6">
                        <input type="text" class="form-control" id="name" placeholder="" v-model="banner.name"
                            :class="{ error: nameError.status, success: nameSuccess.status }" />
                        <p class="text-error" v-if="nameError.status">
                            {{ nameError.text }}
                        </p>
                        <p class="success-text" v-if="nameSuccess.status">
                            {{ nameSuccess.text }}
                        </p>
                    </div>
                </div>

                <fieldset class="form-group mb-4">
                    <div class="row">
                        <label class="col-form-label col-xl-2 col-sm-3 col-sm-2 pt-0">Trạng Thái</label>
                        <div class="col-xl-10 col-lg-9 col-sm-10">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" :value="true" v-model="banner.status"
                                    id="status" style="width: 16px; height: 16px" />
                                <label class="form-check-label" for="flexCheckDefault">
                                    Hiển Thị
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" :value="false" v-model="banner.status"
                                    id="status" style="width: 16px; height: 16px" checked />
                                <label class="form-check-label" for="flexCheckChecked">
                                    Ẩn
                                </label>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <div class="form-group row mb-4">
                    <div class="col-4">
                        <p class="btn btn-success btn-sm" @click="$refs.file.click()">
                            Chọn file
                        </p>
                    </div>
                    <div class="col-8">
                        <label class="btn btn-default p-0">
                            <input type="file" accept="image/*" ref="file" @change="selectImage" :hidden="true" />
                        </label>
                    </div>
                    <div class="col-xl-10 col-lg-9 col-sm-10">
                        <img v-if="url" :src="url" style="width: 600px; height: 500px; margin-left: 20%" />
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
import BannerService from "../../services/BannerService";
import UploadService from "../../services/UploadService";
export default {
    name: "add-banner",
    data() {
        return {
            message: "",
            currentImage: undefined,
            url: null,
            ID: null,
            banner: {
                id: null,
                code: "",
                name: "",
                images: "",
                status: "",
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
        };
    },
    methods: {
        onSubmitForm() {
            if (this.banner.code.length == 0) {
                this.codeError = {
                    text: "Mã không được để trống",
                    status: true,
                };
            } else if (this.banner.code.length < 4 || this.banner.code.length > 6) {
                this.codeError = {
                    text: "Mã phải từ 4 đến 6 kí tự",
                    status: true,
                };
            } else if (this.banner.code.length > 4 || this.banner.code.length < 6) {
                this.codeSuccess = {
                    text: "Thành công!",
                    status: true,
                };
                 this.codeError = {
                    text: "",
                    status: false,
                };
            } else {
                this.codeError = {
                    text: "",
                    status: false,
                };
            }

            if (this.banner.name.length == 0) {
                this.nameError = {
                    text: "Tên không được để trống",
                    status: true,
                };
            } else if (this.banner.name.length < 6 || this.banner.name.length > 50) {
                this.nameError = {
                    text: "Tên phải từ 6 đến 50 kí tự",
                    status: true,
                };
            } else if (this.banner.name.length > 6 || this.banner.name.length < 50) {
                this.nameSuccess = {
                    text: "Thành công!",
                    status: true,
                };
                 this.nameError = {
                    text: "",
                    status: false,
                };
            } else {
                this.nameError = {
                    text: "",
                    status: false,
                };
            }

            if (this.codeSuccess.status == true && this.nameSuccess.status == true) {
                UploadService.upload(this.currentImage)
                    .then((response) => {
                        console.log();
                        this.message = response.data.message;
                    })
                    .catch((err) => {
                        this.message = "Could not upload the image! " + err;
                        this.currentImage = undefined;
                    });

                BannerService.create(this.banner)
                    .then((res) => {
                        //Perform Success Action
                        this.ID = res.data.id;
                        this.banner.id = this.ID;
                        console.log(this.banner.id);
                        console.log(res.data);
                        res.data.files;
                    })
                    .catch((error) => {
                        // error.response.status Check status code
                        console.log(error);
                    })
                    .finally(() => {
                        //Perform action in always
                    });
                this.$emit("ShowData", this.banner);
            }
        },
        selectImage() {
            this.currentImage = this.$refs.file.files.item(0);
            this.url = URL.createObjectURL(this.currentImage);
            this.banner.images = this.$refs.file.files.item(0).name;
        },
    },
};
</script>
