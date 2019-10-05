$(document).on('turbolinks:load',function(){

  url = window.location.href;
  try {
    var user_id = url.match(new RegExp("admin/" + "(.*)" + "/edit"))[1];
  }
  catch(err) {
    var user_id = null;
  }

  console.log(user_id);

$("#search").keyup(function(){
   $.ajax({url: "/admin/client_management.js",
   data: {
   search: $('#search').val()
          },
   success: function(result) {

}});
});

  $("#client_registration_form").validate({
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
        remote: "This user name is already taken"
      }
    }
  });

  $("#edit_client_registartion").validate({
    rules:{
      "user[client_name]":{
        required: true,
        minlength: 2,
        maxlength: 32
      },
      "user[user_name]":{
        required: true,
        minlength: 2,
        maxlength: 32,
        remote: "/unique_user_name?id="+user_id
      },
      "user[email]":{
        required: true,
        emailRegex: true,
        remote: "/unique_email?id="+user_id
      },
      "user[comission]":{
        required: true,
        max: 100,
        maxlength: 8
      },
      "user[password]":{
        minlength: 8,
        maxlength: 32
      },
      "user[confirm_password]":{
        minlength: 8,
        maxlength: 32,
        equalTo: "#user_password"
      }
    },
    messages: {
      "user[confirm_password]":{
        equalTo: "Password And Confirm Password Should Be Same"
      },
      "user[email]":{
        remote: "email id already exist"
      },
      "user[user_name]":{
        remote: "User name already exist"
      }
    }

  });
});
