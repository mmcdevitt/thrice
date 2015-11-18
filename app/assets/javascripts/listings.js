$(document).ready(function() {
  var $addedToCartBtn = $('#added_to_cart_btn');

  $('#selling_price').keyup(function() {
    $('#buyer_pays').text('$' + Math.round($(this).val() * 100) / 100);
    $('#earnings').text('$' + Math.round($(this).val() * 0.95 * 100) / 100);
  });

  $('input[type=radio]:checked').parent().addClass('active')

  // Hide 'add to cart' btn when submitted. Replace with 'Go to cart' btn.
  $addedToCartBtn.hide();
  $('#submit-btn').click(function() {
    $(this).hide();
    $addedToCartBtn.show();
  });
});




