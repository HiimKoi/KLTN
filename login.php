<style>
#uni_modal .modal-content>.modal-footer,
#uni_modal .modal-content>.modal-header {
    display: none;
}

label.error {
    color: red;
}
</style>

<script src="plugins/jquery-validation/jquery.validate.min.js"></script>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>

<div class="container-fluid">

    <div class="row">
        <h3 class="float-right">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </h3>
        <div class="col-lg-12">
            <h3 class="text-center">Đăng nhập</h3>
            <hr>
            <form action="" id="login-form">
                <div class="form-group">
                    <label for="" class="control-label">Email</label>
                    <input type="email" class="form-control form" name="email" required>
                </div>
                <div class="form-group">
                    <label for="" class="control-label">Mật khẩu</label>
                    <input type="password" class="form-control form" name="password" required>
                </div>
                <div class="g-recaptcha" data-sitekey="6Ld1bS8lAAAAAE5ALLD4PLte_8E2-_KOMG66pHZ6"></div><br />
                <div class="form-group d-flex justify-content-between">
                    <a href="javascript:void()" id="create_account">Tạo tài khoản</a>
                    <button class="btn btn-primary btn-flat">Đăng nhập</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
$(function() {
    $('#create_account').click(function() {
        uni_modal("", "registration.php", "mid-large")
    });

    // $.validator.addMethod("validatePassword", function (value, element) {
    //     return this.optional(element) || /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}$/i.test(value);
    // }, "Hãy nhập password từ 8 đến 16 ký tự bao gồm chữ hoa, chữ thường và ít nhất một chữ số");

    $.validator.addMethod("validatePasswordType", function(value, element) {
        return this.optional(element) || /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}$/i.test(value);
    }, "Password không hợp lệ");

    // check validate input of user
    $("#login-form").validate({
        onfocusout: false,
        onkeyup: false,
        onclick: false,
        rules: {
            "email": {
                required: true,
                minlength: 15,
                email: true
            },
            "password": {
                required: true,
                validatePasswordType: true,
                minlength: 8
            }
        },
        messages: {
            "email": {
                required: "Bắt buộc nhập email.",
                minlength: "Email không hợp lệ.",
                email: "Email không hợp lệ."
            },
            "password": {
                required: "Bắt buộc nhập password.",
                validatePasswordType: "Password không hợp lệ.",
                minlength: "Password không hợp lệ."
            }
        },
        submitHandler: function(form, e) {
            e.preventDefault();
            start_loader()
            if ($('.err-msg').length > 0)
                $('.err-msg').remove();
            $.ajax({
                url: _base_url_ + "classes/Login.php?f=login_user",
                method: "POST",
                data: $('form').serialize(),
                dataType: "json",
                error: err => {
                    alert_toast("an error occured", 'error')
                    end_loader()
                },
                success: function(resp) {
                    grecaptcha.reset();
                    if (typeof resp == 'object' && resp.status == 'success') {
                        alert_toast("Login Successfully", 'success')
                        setTimeout(function() {
                            location.reload()
                        }, 2000)
                    } else if (resp.status == 'incorrect') {
                        var _err_el = $('<div>')
                        _err_el.addClass("alert alert-danger err-msg").text(
                            "Incorrect Credentials.")
                        $('#login-form').prepend(_err_el)
                        end_loader()

                    } else {
                        alert_toast(resp.message, 'error')
                        end_loader()
                    }
                }
            })
        }
    });
})
</script>