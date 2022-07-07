<template>

    <div class="statbox widget box box-shadow">
        <div class="widget-header">
            <div class="row">
                <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                    <h4>Thêm Mới Người Dùng</h4>
                </div>
            </div>
        </div>
        <div class="widget-content widget-content-area">
            <form method="post" enctype='multipart/form-data' v-on:submit.prevent="onSubmitForm">
                <div class="form-group row mb-4">
                    <label for="exampleFormControlInput1" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Mã</label>
                    <div class="col-xl-6 col-lg-6 col-sm-6">
                        <input type="text" class="form-control" id="code" placeholder="" v-model="account.code"
                            :class="{ error: codeError.status, success: codeSuccess.status }" />
                        <p class="text-error" v-if="codeError.status">{{ codeError.text }}</p>
                        <p class="success-text" v-if="codeSuccess.status">{{ codeSuccess.text }}
                        </p>
                    </div>

                </div>
                <div class="form-group row mb-4">
                    <label for="hPassword" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Tên người dùng</label>
                    <div class="col-xl-6 col-lg-6 col-sm-6">
                        <input type="text" class="form-control" id="name" placeholder="" v-model="account.name"
                            :class="{ error: nameError.status, success: nameSuccess.status }">
                        <p class="text-error" v-if="nameError.status">{{ nameError.text }}</p>
                        <p class="success-text" v-if="nameSuccess.status">{{ nameSuccess.text }}
                        </p>
                    </div>
                </div>
                <div class="form-group row mb-4">
                    <label for="hPassword" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Email</label>
                    <div class="col-xl-6 col-lg-6 col-sm-6">
                        <input type="text" class="form-control" id="email" placeholder="" v-model="account.email"
                            :class="{ error: emailError.status, success: emailSuccess.status }">
                        <p class="text-error" v-if="emailError.status">{{ emailError.text }}</p>
                        <p class="success-text" v-if="emailSuccess.status">{{ emailSuccess.text }}
                        </p>
                    </div>
                </div>
                <div class="form-group row mb-4">
                    <label for="hPassword" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Số điện thoại</label>
                    <div class="col-xl-6 col-lg-6 col-sm-6">
                        <input type="text" class="form-control" id="phone" placeholder="" v-model="account.phone"
                            :class="{ error: phoneError.status, success: phoneSuccess.status }">
                        <p class="text-error" v-if="phoneError.status">{{ phoneError.text }}</p>
                        <p class="success-text" v-if="phoneSuccess.status">{{ phoneSuccess.text }}
                        </p>
                    </div>
                </div>
                <div class="form-group row mb-4">
                    <label for="hPassword" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Mật Khẩu</label>
                    <div class="col-xl-6 col-lg-6 col-sm-6">
                        <input type="password" class="form-control" id="password" placeholder="" v-model="account.password"
                            :class="{ error: passwordError.status, success: passwordSuccess.status }">
                        <p class="text-error" v-if="passwordError.status">{{ passwordError.text }}</p>
                        <p class="success-text" v-if="passwordSuccess.status">{{ passwordSuccess.text }}
                        </p>
                    </div>
                </div>
                <div class="form-group row mb-4">
                    <label for="hPassword" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Địa chỉ</label>
                    <div class="col-xl-6 col-lg-6 col-sm-6">
                        <input type="text" class="form-control" id="address" placeholder="" v-model="account.address"
                            :class="{ error: addressError.status, success: addressSuccess.status }">
                        <p class="text-error" v-if="addressError.status">{{ addressError.text }}</p>
                        <p class="success-text" v-if="addressSuccess.status">{{ addressSuccess.text }}
                        </p>
                    </div>
                </div>
                
                <div class="form-group row mb-4">
                    <label for="hPassword" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Ngày sinh</label>
                    <div class="col-xl-6 col-lg-6 col-sm-6">
                        <input type="date" class="form-control" id="birthday" placeholder="" v-model="account.birthday">
                       
                    </div>
                </div>
                <fieldset class="form-group mb-4">
                    <div class="row">
                        <label class="col-form-label col-xl-2 col-sm-3 col-sm-2 pt-0">Giới Tính</label>
                        <div class="col-xl-10 col-lg-9 col-sm-10">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" v-model="account.gender" :value="true"
                                    id="gender" style="width: 16px;height: 16px;" />
                                <label class="form-check-label" for="flexCheckDefault"> Nữ
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" v-model="account.gender" :value="false"
                                    id="gender" style="width: 16px;height: 16px;" checked />
                                <label class="form-check-label" for="flexCheckChecked"> Nam </label>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <div class="form-group row mb-4">
                    <label for="hPassword" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Ảnh</label>
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
import AccountService from '@/services/AccountService';
import UploadService from "../../services/UploadService";
export default {
 
    data() {
        return {
           
            message: "",
            currentImage: undefined,
            category: null,
            url: null,
            ID: null,
            account: {
                id: null,
                code: "",
                name: "",
                email: "",
                phone: "",
                password:"",
                address: "",
                birthday: "",
                gender: "",
                images: ""
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
            emailError: {
                text: "",
                status: false,
            },
            emailSuccess: {
                text: "",
                status: false,
            },
            phoneError: {
                text: "",
                status: false,
            },
            phoneSuccess: {
                text: "",
                status: false,
            },
            passwordError: {
                text: "",
                status: false,
            },
            passwordSuccess: {
                text: "",
                status: false,
            },
            addressError: {
                text: "",
                status: false,
            },
            addressSuccess: {
                text: "",
                status: false,
            },
            birthdayError: {
                text: "",
                status: false,
            },
            birthdaySuccess: {
                text: "",
                status: false,
            },
        }

    },
    methods: {
        onSubmitForm() {
         
            if (this.account.code.length == 0) {
                this.codeError = {
                    text: "Mã không được để trống",
                    status: true
                }

            } else if (this.account.code.length < 5) {
                this.codeError = {
                    text: "Mã phải chứa 5 kí tự",
                    status: true
                }


            } else if (this.account.code.length >= 5) {
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

            if (this.account.name.length == 0) {
                this.nameError = {
                    text: "Tên không được để trống",
                    status: true
                }

            } else if (this.account.name.length < 6 || this.account.name.length > 50) {
                this.nameError = {
                    text: "Tên phải từ 6 đến 50 kí tự",
                    status: true
                }


            } else if (this.account.name.length > 6 || this.account.name.length < 50) {
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

        const regex = /^\w+([.-]?\w+)*@[a-z]+([.-]?\w+)*(.\w{2,3})+$/;
        if (this.account.email.length == 0) {
            this.emailError.text = "Email không được bỏ trống",
                this.emailError.status = true
        } else if (!regex.test(this.account.email)) {
            this.emailError.text = "Email không đúng định dạng",
               this.emailError.status = true
        } else if (regex.test(this.account.email)) {
            this.emailSuccess.text = "Thành công!!";
            this.emailSuccess.status = true;
            this.emailError.status = false
        } else {
            this.emailError.text = "",
                this.emailError.status = false
        }

            if (this.account.phone.length == 0) {
                this.phoneError = {
                    text: "Số điện thoại không được để trống",
                    status: true
                }

            } else if (this.account.phone.length != 10) {
                this.phoneError = {
                    text: "Số điện thoại phải chứa 10 kí tự ",
                    status: true
                }
            } else if (this.account.phone.length <11 && this.account.phone.length > 9) {
                this.phoneSuccess = {
                    text: "Thành công!",
                    status: true
                }
                this.phoneError = {
                    text: "",
                    status: false
                }
            } else {
                this.phoneError = {
                    text: "",
                    status: false
                }
            }
            if (this.account.password.length == 0) {
                this.passwordError = {
                    text: "Mật khẩu không được để trống",
                    status: true
                }

            } else if (this.account.password.length < 6) {
                this.passwordError = {
                    text: "Mật khẩu phải chứa ít nhất 6 kí tự ",
                    status: true
                }
            } else if (this.account.password.length >= 6) {
                this.passwordSuccess = {
                    text: "Thành công!",
                    status: true
                }
                this.passwordError = {
                    text: "",
                    status: false
                }
            } else {
                this.passwordError = {
                    text: "",
                    status: false
                }
            }

            if (this.account.address.length == 0) {
                this.addressError = {
                    text: "Địa chỉ không được để trống",
                    status: true
                }

            } else if (this.account.address.length < 6 || this.account.address.length > 50) {
                this.addressError = {
                    text: "Địa chỉ phải từ 6 đến 50 kí tự",
                    status: true
                }


            } else if (this.account.address.length > 6 || this.account.address.length < 50) {
                this.addressSuccess = {
                    text: "Thành công!",
                    status: true
                }
                this.addressError = {
                    text: "",
                    status: false
                }
            } else {
                this.addressError = {
                    text: "",
                    status: false
                }
            }
            if (this.codeSuccess.status == true && this.nameSuccess.status == true && this.emailSuccess.status == true && this.phoneSuccess.status == true && this.passwordSuccess.status == true && this.addressSuccess.status == true ) {
                UploadService.upload(this.currentImage)
                    .then((response) => {
                        console.log();
                        this.message = response.data.message;
                    })
                    .catch((err) => {
                        this.message = "Không thể tải ảnh lên ! " + err;
                        this.currentImage = undefined;
                    });
                AccountService.create(this.account)
                    .then((res) => {
                        //Perform Success Action
                        this.ID = res.data.id;
                        this.account.id = this.ID;
                        console.log(this.account);
                    })
                    .catch((error) => {
                        // error.response.status Check status code
                        console.log(error);
                    })
                    .finally(() => {
                        //Perform action in always
                    });
                this.$emit("ShowData", this.account);

            }

        },
        selectImage() {
            this.currentImage = this.$refs.file.files.item(0);
            this.url = URL.createObjectURL(this.currentImage);
            this.account.images = this.$refs.file.files.item(0).name;
        }
    }

}
</script>
