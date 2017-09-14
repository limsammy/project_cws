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
//= require jquery.min.js
//= require tether.min.js
//= require bootstrap-extension.min.js
//= require sidebar-nav.min.js
//= require jquery.slimscroll.js
//= require waves.js
//= require custom.min.js
//= require jQuery.style.switcher.js
//= require rails-ujs
//= require turbolinks
//= require jquery_nested_form
//= require bootstrap-datepicker
//= require_tree ../../../vendor/assets/js/.
//= require_tree .


// $(document).on('change', '.quant', function(){
// 	console.log("aaaaa");
// 	var element = this;
// 	id = $('.quant').val();
// 	console.log(id);
// })

$(document).on('keyup	', '.quant', function(){
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
