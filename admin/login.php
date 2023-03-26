<?php require_once('../config.php') ?>
<!DOCTYPE html>
<html lang="en" class="" style="height: auto;">
<?php require_once('inc/header.php') ?>
<style>
label.error {
    color: red;
}
</style>

<body class="hold-transition login-page  dark-mode">
    <script>
    start_loader()
    </script>
    <div class="login-box">
        <!-- /.login-logo -->
        <div class="card card-outline card-primary">
            <div class="card-header text-center">
                <a href="./" class="h1"><b>Đăng nhập</b></a>
            </div>
            <div class="card-body">
                <p class="login-box-msg">Đăng nhập để bắt đầu</p>

                <form id="login-frm" action="">
                    <div class="form-group mb-3">
                        <input type="text" class="form-control" name="username" placeholder="Username">
                    </div>
                    <div class="form-group mb-3">
                        <input type="password" class="form-control" name="password" placeholder="Password">
                    </div>
                    <div class="g-recaptcha" data-sitekey="6Ld1bS8lAAAAAE5ALLD4PLte_8E2-_KOMG66pHZ6"></div><br />
                    <div class="row">
                        <div class="col-8">
                            <a href="<?php echo base_url ?>">Đi đến Website</a>
                        </div>
                        <!-- /.col -->
                        <div class="col-4">
                            <button class="btn btn-primary btn-block">Đăng nhập</button>
                        </div>
                        <!-- /.col -->
                    </div>
                </form>
                <!-- /.social-auth-links -->

                <!-- <p class="mb-1">
        <a href="forgot-password.html">I forgot my password</a>
      </p> -->

            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.card -->
    </div>
    <!-- /.login-box -->

    <!-- jQuery -->
    <script src="plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/adminlte.min.js"></script>

    <script src="plugins/jquery-validation/jquery.validate.min.js"></script>
    <!-- <script src="./../plugins" -->
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <script>
    $(document).ready(function() {
        end_loader();
    })
    </script>
</body>

</html>