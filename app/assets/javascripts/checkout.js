$(document).ready(function() {
  $('#payment-form input.disable-btn').keyup(function() {
    var empty = false;
    $('#payment-form input.disable-btn').each(function() {
        if ($(this).val() == '') {
            empty = true;
        }
    });

    if (empty) {
        $('.payment_submit').attr('disabled', 'disabled');
    } else {
        $('.payment_submit').removeAttr('disabled');
    }
  });
});
