<section class="py-5">
    <div class="container">
        <div class="card rounded-0">
            <div class="card-body">
                <div class="w-100 justify-content-between d-flex">
                    <h4><b>Cập nhật thông tin tài khoản</b></h4>
                    <a href="./?p=my_account" class="btn btn btn-dark btn-flat">
                        <div class="fa fa-angle-left"></div> Quay lại
                    </a>
                </div>
                <hr class="border-warning">
                <div class="col-md-6">
                    <form action="" id="update_account">
                        <input type="hidden" name="id" value="<?php echo $_settings->userdata('id') ?>">
                        <div class="form-group">
                            <label for="firstname" class="control-label">Tên</label>
                            <input type="text" name="firstname" class="form-control form"
                                value="<?php echo $_settings->userdata('firstname') ?>" required>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="control-label">Họ</label>
                            <input type="text" name="lastname" class="form-control form"
                                value="<?php echo $_settings->userdata('lastname') ?>" required>
                        </div>
                        <div class="form-group">
                            <label for="" class="control-label">Liên hệ</label>
                            <input type="text" class="form-control form-control-sm form" name="contact"
                                value="<?php echo $_settings->userdata('contact') ?>" required>
                        </div>
                        <div class="form-group">
                            <label for="" class="control-label">Giới thiệu</label>
                            <select name="gender" id="" class="custom-select select" required>
                                <option <?php echo $_settings->userdata('gender') == "Male" ? "selected" : '' ?>>Nam
                                </option>
                                <option <?php echo $_settings->userdata('gender') == "Female" ? "selected" : '' ?>>Nữ
                                </option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="" class="control-label">Địa chỉ</label>
                            <textarea class="form-control form" rows='3'
                                name="default_delivery_address"><?php echo $_settings->userdata('default_delivery_address') ?></textarea>
                        </div>
                        <div class="form-group">
                            <label for="email" class="control-label">Email</label>
                            <input type="text" name="email" class="form-control form"
                                value="<?php echo $_settings->userdata('email') ?>" required>
                        </div>
                        <div class="form-group">
                            <label for="password" class="control-label">Mật khẩu mới</label>
                            <input type="password" name="password" class="form-control form" value=""
                                placeholder="(Nhập mật khẩu mới)">
                        </div>
                        <div class="form-group">
                            <label for="cpassword" class="control-label">Mật khẩu cũ</label>
                            <input type="password" name="cpassword" class="form-control form" value=""
                                placeholder="(Nhập mật khẩu cũ)">
                        </div>
                        <div class="form-group d-flex justify-content-end">
                            <button class="btn btn-dark btn-flat">Cập nhật</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    $(function () {
        $('#update_account [name="password"],#update_account [name="cpassword"]').on('input', function () {
            if ($('#update_account [name="password"]').val() != '' || $(
                '#update_account [name="cpassword"]').val() != '')
                $('#update_account [name="password"],#update_account [name="cpassword"]').attr('required',
                    true);
            else
                $('#update_account [name="password"],#update_account [name="cpassword"]').attr('required',
                    false);
        })
        $('#update_account').submit(function (e) {
            e.preventDefault();



            // return;

            start_loader()
            if ($('.err-msg').length > 0)
                $('.err-msg').remove();
            $.ajax({
                url: _base_url_ + "classes/Master.php?f=update_account",
                method: "POST",
                data: $(this).serialize(),
                dataType: "json",
                error: err => {
                    console.log(err)
                    alert_toast("an error occured", 'error')
                    end_loader()
                },
                success: function (resp) {
                    // debugger;
                    // console.log(resp);
                    if (typeof resp == 'object' && resp.status == 'success') {
                        alert_toast("Account succesfully updated", 'success');
                        $('#update_account [name="password"],#update_account [name="cpassword"]')
                            .attr('required', false);
                        $('#update_account [name="password"],#update_account [name="cpassword"]')
                            .val('');

                        // clean input
                        let firstname = htmlspecialchars($("input[name=firstname]").val());
                        $("input[name=firstname]").val(firstname);
                        // console.log($("input[name=firstname]").val());

                        let lastname = htmlspecialchars($("input[name=lastname]").val());
                        $("input[name=lastname]").val(lastname);
                        // console.log($("input[name=lastname]").val());

                        let contact = htmlspecialchars($("input[name=contact]").val());
                        $("input[name=contact]").val(contact);
                        // console.log($("input[name=contact]").val());

                        let address = htmlspecialchars($(
                            "textarea[name=default_delivery_address]").val());
                        $("textarea[name=default_delivery_address]").val(address);

                        // console.log($("textarea[name=default_delivery_address]").val());

                        let email = htmlspecialchars($("input[name=email]").val());
                        $("input[name=email]").val(email);

                    } else if (resp.status == 'failed' && !!resp.msg) {
                        var _err_el = $('<div>')
                        _err_el.addClass("alert alert-danger err-msg").text(resp.msg)
                        $('#update_account').prepend(_err_el)
                        $('body, html').animate({
                            scrollTop: 0
                        }, 'fast')
                        end_loader()

                    } else {
                        // console.log(resp)
                        alert_toast("an error occured", 'error')
                    }
                    end_loader()
                }
            })
        })
    });

    function htmlspecialchars(str) {

        return str
            .replace(/&/g, '&amp;')
            .replace(/>/g, '&gt;')
            .replace(/</g, '&lt;')
            .replace(/"/g, '&quot;')
            .replace(/'/g, '&apos;');

        return str;
    }
</script>