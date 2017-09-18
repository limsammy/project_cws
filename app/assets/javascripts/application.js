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
//= require jquery
//= require jquery.turbolinks
//= require jquery.min.js
//= require tether.min.js
//= require bootstrap.min.js
//= require bootstrap-extension.min.js
//= require sidebar-nav.min.js
//= require jquery.slimscroll.js
//= require waves.js
//= require custom.min.js
//= require jQuery.style.switcher.js
//= require jquery.dataTables.min.js
//= require rails-ujs
//= require jquery_nested_form
//= require bootstrap-datepicker
//= require_tree ../../../vendor/assets/js/.
//= require_tree .
//= require select2


// $(document).on('change', '.quant', function(){
// 	var element = this;
// 	id = $('.quant').val();
// })

$(document).on('keyup', '.quant', function(){
  quantity = $(this).val();
  unit_price = quantity * ($('#uprice').val());
  $.ajax({
  	url: "/products/per_amount",
  	data: {id: quantity},
  	dataType: "json",
  	type: "GET",
    success:function() {
      $('#amt').val(unit_price);
    }
  });
})

$(document).on('change', '.product_id', function(){
  product_id = $(this).val();
  $.ajax({
    url:  "/products/per_price",
    data:  {id: product_id},
    dataType: "json",
    type: "GET",
    success:function(data) {
      $('#uprice').val(data.value);
    }
  });
})

$(document).ready(function(){
  $('#order_order_at').datepicker({
    format: 'dd/mm/yyyy', "autoclose": true
  });
});

$(document).ready(function(){
  $('.country_dropdown').select2();
  $('.state_dropdown').select2();
  $('.city_dropdown').select2();

  $('#company_address_attributes_country').bind("change keyup",function(event) {
    element = $(this).val()
    $.ajax({
      url: '/companies/find_states',
      data: {country_value: element},
      type: "GET",
      success:function(data) {
        var output = [];
        output.push('<option value="">Select State </option>');
        $.each(data, function(key, value){
          output.push('<option value="'+ key +'">'+ value +'</option>');
        });
        $('#company_address_attributes_state').html(output);
      }
    });
});

  $('#company_address_attributes_state').bind("change keyup",function(event) {
    element = $(this).val()
    country_value = $('#company_address_attributes_country').val()
    $.ajax({
      url: "/companies/find_cities",
      data: {country_value: country_value, state_value: element},
      type: "GET",
      success: function (data) {
        var output = [];
        output.push('<option value=""> </option>');

        $.each(data, function(key, value){
          output.push('<option value="'+ key +'">'+ value +'</option>');
        });
        $('#company_address_attributes_city').html(output);
      }
    });
  });
})
