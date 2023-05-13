<style>
    #uni_modal .modal-content>.modal-footer,
    #uni_modal .modal-content>.modal-header {
        display: none;
    }

    label.error {
        color: red;
    }
</style>
<div class="container-fluid">
    <form action="" id="registration">
        <div class="row">

            <h3 class="text-center">Tạo tài khoản
                <span class="float-right">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </span>
            </h3>
            <hr>
        </div>
        <div class="row  align-items-center h-100">

            <div class="col-lg-5 border-right">

                <div class="form-group">
                    <label for="" class="control-label">Tên</label>
                    <input type="text" class="form-control form-control-sm form" name="firstname" required>
                </div>
                <div class="form-group">
                    <label for="" class="control-label">Họ</label>
                    <input type="text" class="form-control form-control-sm form" name="lastname" required>
                </div>
                <div class="form-group">
                    <label for="" class="control-label">Liên hệ</label>
                    <input type="text" class="form-control form-control-sm form" name="contact" required>
                </div>
                <div class="form-group">
                    <label for="" class="control-label">Giới tính</label>
                    <select name="gender" id="" class="custom-select select" required>
                        <option>Nam</option>
                        <option>Nữ</option>
                    </select>
                </div>
            </div>
            <div class="col-lg-7">
                <div class="form-group">
                    <label for="" class="control-label">Địa chỉ</label>
                    <textarea class="form-control form" rows='3' name="default_delivery_address"></textarea>
                </div>
                <div class="form-group">
                    <label for="" class="control-label">Email</label>
                    <input type="text" class="form-control form-control-sm form" name="email" required>
                </div>
                <div class="form-group">
                    <label for="" class="control-label">Password</label>
                    <input type="password" class="form-control form-control-sm form" name="password" required>
                </div>
                <div class="form-group d-flex justify-content-between">
                    <a href="javascript:void()" id="login-show">Bạn đã có tài khoản</a>
                    <button class="btn btn-primary btn-flat">Tạo tài khoản</button>
                </div>
            </div>
        </div>
    </form>

</div>
<script>
    $(function () {
        $('#login-show').click(function () {
            uni_modal("", "login.php");
        });

        $.validator.addMethod("validatePasswordType", function (value, element) {
            return this.optional(element) || /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}$/i.test(value);
        }, "Password không hợp lệ");

        // $.validator.setDefaults({
        //     messages: {

        //     }
        // });
        $.validator.messages.required = 'Bắt buộc nhập dữ liệu';

        $("#registration").validate({
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
                    validatePasswordType: "Password từ 8 đến 16 ký tự bao gồm chữ hoa, chữ thường và chữ số.",
                    minlength: "Password không hợp lệ."
                },
                // required: "Bắt buộc nhập dữ liệu."
            },
            submitHandler: function (form, e) {
                e.preventDefault();
                start_loader();
                if ($('.err-msg').length > 0) {
                    $('.err-msg').remove();
                }
                $.ajax({
                    url: _base_url_ + "classes/Master.php?f=register",
                    method: "POST",
                    data: $('form').serialize(),
                    dataType: "json",
                    success: function (resp) {
                        console.log(resp);
                        end_loader();

                        if (typeof resp == 'object' && resp.status == 'success') {
                            alert_toast("Account succesfully registered", 'success');
                            setTimeout(function () {
                                location.reload()
                            }, 2000);
                        } else if (resp.status == 'failed' && !!resp.msg) {
                            var _err_el = $('<div>');
                            _err_el.addClass("alert alert-danger err-msg").text(resp.msg);
                            $('[name="password"]').after(_err_el);
                        } else {
                            if (typeof resp == 'object' && resp.message == 'object') {
                                alert_toast(resp.message, 'error');
                            } else {
                                alert_toast("an error occured", 'error');
                            }
                        }
                    }
                })
            }
        });
    });
</script>