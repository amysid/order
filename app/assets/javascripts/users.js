// require turbolinks
// require popper.min.js
// require jquery3.4
// require jquery_ujs
// require jquery-ui
// require rails-ujs
// require jquery.validate
// require jquery.validate.additional-methods
// require moment
// require bootstrap-datetimepicker
// require alertify
// require activestorage
// require ./web/intlInputPhone.js
// require_tree ./web
 $.validator.addMethod("emailRegex", function(value, element) {
    return this.optional(element) || /^[A-Z0-9_-]+([\.][A-Z0-9_]+)*@[A-Z0-9-]+(\.[a-zA-Z]{2,3})+$/i.test(value);
  }, "Please enter a valid email address.");
$(document).on('turbolinks:load',function(){

  $("#user_login_form").validate({
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

  // $("#req_password").validate({
  //   rules: {
  //     "forgot_password[email]":{
  //       required: true,
  //       emailRegex: true
  //     }
  //  }
  // });
$("#user_sec_form").validate({
    rules: {
   "token":{
        required: true,
        minlength: 2,
        maxlength: 8
      }
   }
  });



$("#user_request_password_form").validate({
  rules: {
    "forgot_password[email]": {
      required: true,
      emailRegex: true

    }
  },
   messages: {
      "forgot_password[email]":{
        emailRegex: "Please enter valid email"
      }
  }
});
});
