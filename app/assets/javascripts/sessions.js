$(document).on('turbolinks:load',function(){



$(document).on('click', '#change_password', function (e) {


  Swal.fire({
  title: 'Change Password',
  html:
    '<input id="swal-input1" class="swal2-input" placeholder="enter current password" name="input1" type "input">' +
    '<input id="swal-input2" class="swal2-input" placeholder="enter new password">' +
    '<input id="swal-input3" class="swal2-input" placeholder="confirm new password">',
  preConfirm: function () {
    return new Promise(function (resolve,reject) {
      if ( $('#swal-input2').val() != $('#swal-input3').val()) {
        Swal.fire({
      type: 'error',
      title: 'Oops...',
      text: 'Password and password confirmation didnot match'
      })
                  //  reject('err')
                } else {
      resolve([
        $('#swal-input1').val(),
        $('#swal-input2').val(),
        $('#swal-input3').val()
      ])
    }
    })
  },
  onOpen: function () {
    $('#swal-input1').focus()
  }
}).then(function (isConfirm) {

$.ajax({url: "/sessions/update_password.js",
data: {
old_password: $('#swal-input1').val(),
new_password: $('#swal-input2').val(),
confirm_password: $('#swal-input3').val()
       },
success: function(result) {
  Swal.fire(
    'Success!',
    'Your password has been updated',
    'success'
  )
},
error: function (data) {
  Swal.fire({
type: 'error',
title: 'Oops...',
text: 'Current password is incorrect!'
})
   }
});
});

  });

  $("#update_profile").submit(function(e) {

  $.ajax({
         type: "POST",
         url : "/update_profile",
         data: $("#update_profile").serialize(), // serializes the form's elements.
         success: function(result) {
           Swal.fire(
             'Success!',
             'Your profile has been updated',
             'success'
           )
         },
         error: function (data) {
           Swal.fire({
         type: 'error',
         title: 'Oops...',
         text: 'Something went wrong!'
         })
            }
       });

  });



  $("#login_form").validate({
    rules: {
      "user[email]":{
        required: true,
        emailRegex: true

      },
      "user[password]":{
        required: true,
        minlength: 8,
        maxlength: 32
      }
   }
  });

  $("#req_password").validate({
    rules: {
      "forgot_password[email]":{
        required: true,
        emailRegex: true
      }
   }
  });
$("#sec_form").validate({
    rules: {
   "otp":{
        required: true,
      }
   }
  });


  $(".otp").keyup(function () {
   if (this.value.length == this.maxLength) {
     var $next = $(this).next('.otp');
     if ($next.length)
      $(this).next('.otp').focus();
     else
      $(this).blur();
     }
  });

  $('.resend').click(function (e) {

      // var wrapper = document.createElement('div');
      // wrapper.innerHTML = '<div class="swal2-actions swal2-loading" style="display: flex;"><button type="button" class="swal2-confirm swal2-styled" aria-label="" style="display: flex; border-left-color: rgb(48, 133, 214); border-right-color: rgb(48, 133, 214);" disabled="">OK</button></div>'


    Swal.fire({
      title: 'Sending OTP',
      text: 'Please wait ...',
      buttons: false,
      // content: wrapper,
      // closeOnClickOutside: false,
      // closeOnEsc: false,
    });
    swal.showLoading();

    // $.ajax
       $.ajax({url: "/resend.js",
   success: function(result) {
      // swal.close();
    // debugger;
      $(document.getElementsByName("verify_otp[otp][]")[0]).focus()
      initiate_swal('success', 'Your new OTP is sent to your mail.');
    },
    error: function(error){
      // debugger;
      // swal.close();
      initiate_swal('error', 'Oops...',"Something went wrong!");

    }
});



  });
  $("#update_profile").validate({
    rules: {
      "user[client_name]":{
        required: true,
        minlength: 2,
        maxlength: 32
      },
      "user[address]":{
        required: true
      },
      "user[country]":{
        required: true
      },
      "user[gender]":{
        required: true
      },
      "user[mobile]":{
        required: true
      },
      "user[dob]":{
        required: true
      }




    },
    messages: {

      }
    });
  });
