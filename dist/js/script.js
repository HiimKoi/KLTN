function start_loader() {
  $("body").append(
    '<div id="preloader"><div class="loader-holder"><div></div><div></div><div></div><div></div>'
  );
}
function end_loader() {
  $("#preloader").fadeOut("fast", function () {
    $("#preloader").remove();
  });
}
// function
window.alert_toast = function ($msg = "TEST", $bg = "success", $pos = "") {
  var Toast = Swal.mixin({
    toast: true,
    position: $pos || "top-end",
    showConfirmButton: false,
    timer: 5000,
  });
  Toast.fire({
    icon: $bg,
    title: $msg,
  });
};

$(document).ready(function () {
  $("#login-frm").validate({
    onfocusout: false,
    onkeyup: false,
    onclick: false,
    rules: {
      username: {
        required: true,
        minlength: 5,
      },
      password: {
        required: true,
        minlength: 6,
      },
    },
    messages: {
      username: {
        required: "Bắt buộc nhập username.",
        minlength: "Email không hợp lệ.",
      },
      password: {
        required: "Bắt buộc nhập password.",
        minlength: "Password không hợp lệ.",
      },
    },
    submitHandler: function (form, e) {
      e.preventDefault();
      start_loader();
      if ($(".err_msg").length > 0) $(".err_msg").remove();
      $.ajax({
        url: _base_url_ + "classes/Login.php?f=login",
        method: "POST",
        data: $("form").serialize(),
        // error: (err) => {
        //   console.log(err);
        // },
        success: function (resp) {
          console.log(resp);
          grecaptcha.reset();

          end_loader();
          if (resp) {
            resp = JSON.parse(resp);
            if (resp.status == "success") {
              location.replace(_base_url_ + "admin");
            } else if (resp.status == "incorrect") {
              var _frm = $("#login-frm");
              var _msg =
                "<div class='alert alert-danger text-white err_msg'><i class='fa fa-exclamation-triangle'></i> Incorrect username or password</div>";
              _frm.prepend(_msg);
              _frm.find("input").addClass("is-invalid");
              $('[name="username"]').focus();
            } else {
              alert_toast(resp.message, "error");
              end_loader();
            }
          }
        },
      });
    },
  });

  //Establishment Login
  $("#flogin-frm").submit(function (e) {
    e.preventDefault();
    start_loader();
    if ($(".err_msg").length > 0) $(".err_msg").remove();
    $.ajax({
      url: _base_url_ + "classes/Login.php?f=flogin",
      method: "POST",
      data: $(this).serialize(),
      error: (err) => {
        console.log(err);
      },
      success: function (resp) {
        end_loader();
        if (resp) {
          resp = JSON.parse(resp);
          if (resp.status == "success") {
            location.replace(_base_url_ + "faculty");
          } else if (resp.status == "incorrect") {
            var _frm = $("#flogin-frm");
            var _msg =
              "<div class='alert alert-danger text-white err_msg'><i class='fa fa-exclamation-triangle'></i> Incorrect username or password</div>";
            _frm.prepend(_msg);
            _frm.find("input").addClass("is-invalid");
            $('[name="username"]').focus();
          }
        }
      },
    });
  });

  //user login
  $("#slogin-frm").submit(function (e) {
    e.preventDefault();
    start_loader();
    if ($(".err_msg").length > 0) $(".err_msg").remove();
    $.ajax({
      url: _base_url_ + "classes/Login.php?f=slogin",
      method: "POST",
      data: $(this).serialize(),
      error: (err) => {
        console.log(err);
      },
      success: function (resp) {
        // console.log(resp);
        end_loader();
        if (resp) {
          resp = JSON.parse(resp);
          if (resp.status == "success") {
            location.replace(_base_url_ + "student");
          } else if (resp.status == "incorrect") {
            var _frm = $("#slogin-frm");
            var _msg =
              "<div class='alert alert-danger text-white err_msg'><i class='fa fa-exclamation-triangle'></i> Incorrect username or password</div>";
            _frm.prepend(_msg);
            _frm.find("input").addClass("is-invalid");
            $('[name="username"]').focus();
          }
          else {
            alert_toast(resp.message, "error");
            end_loader();
          }
        }
      },
    });
  });
  // System Info
  $("#system-frm").submit(function (e) {
    e.preventDefault();
    start_loader();
    if ($(".err_msg").length > 0) $(".err_msg").remove();
    $.ajax({
      url: _base_url_ + "classes/SystemSettings.php?f=update_settings",
      data: new FormData($(this)[0]),
      cache: false,
      contentType: false,
      processData: false,
      method: "POST",
      type: "POST",
      success: function (resp) {
        console.log(resp);
        end_loader();

        let respObj = JSON.parse(resp);

        if (typeof respObj == 'object' && typeof respObj.data == 'object') {
          let hasError = false;

          for (const [key, obj] of Object.entries(respObj.data)) {
            console.log(key, obj);
            if (obj.status) {
              console.log("Success: " + obj.msg);
              alert_toast(obj.msg, 'success');
            } else {
              hasError = true;
              console.log("Error: " + obj.msg);
              alert_toast(obj.msg, 'error');
            }
          }

          if (!hasError) {
            location.reload();
          }
      }
      },
    });
  });
});
