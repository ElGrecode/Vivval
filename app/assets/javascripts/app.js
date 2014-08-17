$(document).ready(function() {
    // validate signup form on keyup and submit
    $("#new_user").validate({
      rules: {
        first: "required",
        last: "required",
        password: {
          required: true,
          minlength: 6
        },
        confirmation: {
          equalTo: "#password"
        }
      },
      messages: {
        first: "Your first name?",
        last: "What's up with your last name?",
        password: {
          required: "Throw me a password",
          minlength: "Your password must be at least 6 characters long"
        },
        confirmation: {
          required: "I need a confirmation from you to match your password",
          equalTo: "Your passwords don't match"
        }
      }
    });

  });