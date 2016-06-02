# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



  shops = $('#bid_shop_id').html()
  $('#bid_brand_id').change ->
    brand = $('bid_brand_id :selected').text()
    alert(brand)
    options = $(shops).filter("optgroup[label=('#{brand}')]").html()
    if options
      $('#bid_shop_id').html(options)
    else
      $('#bid_shop_id').hide()
