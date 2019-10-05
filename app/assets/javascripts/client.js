$(document).on('turbolinks:load',function(){
  $("#admin_client_registration_form").validate({
    rules: {
      "user[client_name]":{
        required: true,
        minlength: 2,
        maxlength: 32
      },
      "user[user_name]":{
        required: true,
        minlength: 2,
        maxlength: 32,
        remote: "/unique_user_name"
      },
      "user[email]":{
        required: true,
        emailRegex: true,
        remote: "/unique_email"
      },
      "user[comission]":{
        required: true,
        max: 100,
        maxlength: 8
      },
      "user[password]":{
        required: true,
        minlength: 8,
        maxlength: 32
      },
      "user[confirm_password]":{
        required: true,
        minlength: 8,
        maxlength: 32,
        equalTo: "#user_password"
      },
      "user[base_salary]":{
       required: true,
       salaryRegex: true   
    }

    },
    messages: {
      "user[confirm_password]":{
        equalTo: "Password And Confirm Password Should Be Same"
      },
      "user[email]":{
        remote: "email id already exist.",
      },
      "user[user_name]":{
        remote: "User name already exist"
      }
    }
  });
});