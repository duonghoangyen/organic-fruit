<template>
    <div class="form-container outer">
        <div class="form-form">
            <div class="form-form-wrap">
                <div class="form-container">
                    <div class="form-content">

                        <h1 class="">Sign In</h1>
                        <p class="">Log in to your account to continue.</p>

                        <form class="text-left" v-on:submit.prevent="onLogin">
                            <div class="form">

                                <div class="field-wrapper input">
                                    <label for="username">USERNAME</label>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round" class="feather feather-user">
                                        <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                        <circle cx="12" cy="7" r="4"></circle>
                                    </svg>
                                    <input id="email" name="email" type="email" class="form-control"
                                        placeholder="Email" v-model="login.email">
                                </div>

                                <div class="field-wrapper input mb-2">
                                    <div class="d-flex justify-content-between">
                                        <label for="password">PASSWORD</label>
                                        <a href="auth_pass_recovery_boxed.html" class="forgot-pass-link">Forgot
                                            Password?</a>
                                    </div>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round" class="feather feather-lock">
                                        <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                                        <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                                    </svg>
                                    <input id="password" name="password" type="password" class="form-control"
                                        placeholder="Password" v-model="login.password">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round" id="toggle-password" class="feather feather-eye">
                                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                        <circle cx="12" cy="12" r="3"></circle>
                                    </svg>
                                </div>
                                <div class="d-sm-flex justify-content-between">
                                    <div class="field-wrapper">
                                        <button type="submit" class="btn btn-primary" value="">Log In</button>
                                    </div>
                                </div>

<!--                            
                                <p class="signup-link">Not registered ? <a href="auth_register_boxed.html">Create an
                                        account</a></p> -->

                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import AccountService from '@/services/AccountService'
export default {
    data() {
        return {
            user: null,
            login: {
                email: "",
                password: ""
            },
            emailError: {
                text: "",
                status: false
            },
            emailSuccess: {
                text: "",
                status: false
            }
        }
    },
    mounted() {

    },
    methods: {
        onLogin() {
            if (this.login.email) {
                console.log(this.login.email);
                AccountService.getEmail(this.login.email)  
                    .then((res) => {
                        this.user = res.data;
                        console.log(this.user);
                    })
                    .catch((error) => {
                        console.log(error);
                    })
                    .finally(() => {
                        //Perform action in always
                    })
            }

            if (this.login.email.length == 0) {
                this.emailError = {
                    text: "Tên tài khoản không được để trống",
                    status: true
                }
            }
        }
    }
}
</script>
