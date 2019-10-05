// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require popper.min.js
//= require rails-ujs
//= require jquery3
// require bootstrap-sprockets
// require jquery_ujs
// require jquery-ui
//= require turbolinks
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require jquery_nested_form
//= require moment
//= require bootstrap-datetimepicker
//= require alertify
//= sweetalert.min.js
//= require pagy
//= require activestorage
//= require_tree .

 $.validator.addMethod("emailRegex", function(value, element) {
    return this.optional(element) || /^[A-Z0-9_-]+([\.][A-Z0-9_]+)*@[A-Z0-9-]+(\.[a-zA-Z]{2,3})+$/i.test(value);
  }, "Please enter a valid email address.");

 $.validator.addMethod("salaryRegex", function(value, element) {
    return this.optional(element) ||/^[0-9]+$/.test(value);
  }, "Please enter a valid salary.");


window.addEventListener("turbolinks:load", Pagy.init);
window.addEventListener("load", Pagy.init);

function initiate_swal(type, title, text, timer) {
  swal.close();
  timer = timer || 2000;
  var data = {
    position: 'top-end',
    type: type,
    title: title,
    showConfirmButton: false,
    timer: timer,
    text: text,
    closeOnClickOutside: false,
    closeOnEsc: false,
  }
  if (text != undefined){
    data["text"] = text
  }
  Swal.fire(data)
}

// $(document).on('click', '#change_password', function (e) {
//
//   Swal.mixin({
//     input: 'text',
//     confirmButtonText: 'Next &rarr;',
//     showCancelButton: true,
//     progressSteps: ['1', '2', '3']
//   }).queue([
//     {
//       title: 'Your current password'
//       //text: 'Chaining swal2 modals is easy'
//     },
//     'Enter new password',
//     'Confirm new password'
//   ]).then((result) => {
//     if (result.value) {
//       Swal.fire({
//         title: 'All done!',
//         html:
//           'Your answers: <pre><code>' +
//             JSON.stringify(result.value) +
//           '</code></pre>',
//         confirmButtonText: 'Lovely!'
//       })
//     }
//   });
// });

// $(document).on('turbolinks:load',function(){
//
// $("#transactions").keyup(function(){
//    $.ajax({url: "/transactions",
//    data: {
//    search: $('#transactions').val()
//           },
//    success: function(result) {
//
// }});
// });
//
// });
