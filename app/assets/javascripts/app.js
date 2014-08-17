$(document).ready(function() {
    // validate signup form on keyup and submit
    $("#new_user").validate({
      ignore: ".ignore",
      rules: {
        'user[first_name]': "required",
        'user[last_name]': "required",
        'user[password]': {
          required: true,
          minlength: 6
        },
        'user[password_confirmation]': {
          equalTo: "#password"
        }
      },
      messages: {
        'user[first_name]': "Your first name?",
        'user[last_name]': "What's up with your last name?",
        'user[password]': {
          required: "Throw me a password",
          minlength: "Your password must be at least 6 characters long"
        },
        'user[password_confirmation]': {
          equalTo: "Your passwords don't match"
        }
      }
    });

  });