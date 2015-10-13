$(document).ready(function() {
  $('#selling_price').keyup(function() {
    $('#buyer_pays').text('$' + Math.round($(this).val() * 100) / 100);
    $('#earnings').text('$' + Math.round($(this).val() * 0.90 * 100) / 100);
  });

  $('input[type=radio]:checked').parent().addClass('active')
});




