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
//= require jquery.PrintArea.js
//= require chart.min.js
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

function datatable(id, default_sort_column, non_sortable_columns, pageLength, extra){
  var check_length = $('#'+id+'_wrapper').length
  if (jQuery().dataTable && check_length==0) {
        var table = jQuery('#'+id);
        table.dataTable({
          dom: 'lBfrtip',
          buttons: [
            {
              extend: 'excelHtml5',
              exportOptions: {
                // columns: ':visible'
                columns: ((extra == "nil") ? ":visible" : extra)
              }
            },
            {
              extend: 'pdfHtml5',
              exportOptions: {
                // columns: ':visible'
                columns: ((extra == "nil") ? ":visible" : extra)
              }
            },
          ],
          "lengthMenu": [
            [5, 15, 20, -1],
            [5, 15, 20, "All"] // change per page values here
          ],
          // set the initial value
          "pageLength": pageLength,
          "paginationType": "full_numbers",
          "language": {
            "lengthMenu": "  _MENU_ records",
            "paginate": {
              "previous":"Prev",
              "next": "Next",
              "last": "Last",
              "first": "First"
            }
          },
          "columnDefs": [
          {
            "targets": '_all',
            "defaultContent": "<i>Not set</i>",
          },
          {  // set default column settings
            'orderable': false,
            'targets': non_sortable_columns
          }, {
            "searchable": false,
            "targets": [0]
          }],
          "order": [
            [default_sort_column, "asc"]
          ] // set first column as a default sort by asc
        });

        var tableWrapper = jQuery('#datatable_sample_wrapper');

        table.find('.group-checkable').change(function () {
          var set = jQuery(this).attr("data-set");
          var checked = jQuery(this).is(":checked");
          jQuery(set).each(function () {
            if (checked) {
              jQuery(this).attr("checked", true);
              jQuery(this).parents('tr').addClass("active");
            } else {
              jQuery(this).attr("checked", false);
              jQuery(this).parents('tr').removeClass("active");
            }
          });
          jQuery.uniform.update(set);
        });

        table.on('change', 'tbody tr .checkboxes', function () {
          jQuery(this).parents('tr').toggleClass("active");
        });

        tableWrapper.find('.dataTables_length select').addClass("form-control input-xsmall input-inline"); // modify table per page dropdown
  }
}

$(document).on('keyup', '.quant', function(){
  var quantity = $(this).val();
  var product = $('.product_id').val();
  var $this = $(this);
  var price = $(this).parents('.main').find('.uprice').val();
  $.ajax({
    url: "/products/per_amount",
    data: {id: quantity, product: product},
    dataType: "json",
    type: "GET",
    success:function(data) {
      if (data.value == -1){
        $this.parents('.main').find('.out_of_stock_msg').removeClass("hidden");
      }else{
        $('.out_of_stock_msg').addClass("hidden");
      }
        var total_price = (quantity * price).toFixed(2);
        $this.parents('.main').find('.amt').val(total_price);
    }
  });
})

$(document).on('change', '.product_id', function(){
  var product_id = $(this).val();
  var $this = $(this);
  $.ajax({
    url:  "/products/per_price",
    data:  {id: product_id},
    dataType: "json",
    type: "GET",
    success:function(data) {
      $this.parents('.main').find('.uprice').first().val(data.value);
    }
  });
})

$(document).ready(function(){
  $('#order_ordered_at').datepicker({
    format: 'dd/mm/yyyy', "autoclose": true
  });
});

var chartoption1 = {
  scaleShowGridLines : true,
  scaleGridLineColor : "rgba(0,0,0,.005)",
  scaleGridLineWidth : 0,
  scaleShowHorizontalLines: true,
  scaleShowVerticalLines: true,
  bezierCurve : true,
  bezierCurveTension : 0.4,
  pointDot : true,
  pointDotRadius : 4,
  pointDotStrokeWidth : 1,
  pointHitDetectionRadius : 2,
  datasetStroke : true,
  tooltipCornerRadius: 2,
  datasetStrokeWidth : 2,
  datasetFill : true,
  legendTemplate : "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].strokeColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>",
  responsive: true
}
function chart(id, value1, value2, type){
  $( document ).ready(function() {
    var ctx = document.getElementById(id).getContext("2d");
    var data1 ={
      labels: value2,
      datasets: [
      {
          label: "My First dataset",
          fillColor: "rgba(152,235,239,0.8)",
          strokeColor: "rgba(152,235,239,0.8)",
          pointColor: "rgba(152,235,239,1)",
          pointStrokeColor: "#fff",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "rgba(152,235,239,1)",
          data: value1
      }]
  };
    drawchart(ctx, type, data1)
  })
}

function drawchart(canvas, charttype, data1){
  if(charttype == "Line"){
     new Chart(canvas).Line(data1, chartoption1);
  }else if (charttype == "Bar"){
     new Chart(canvas).Bar(data1, chartoption1);
  }
  else{
     new Chart(canvas).Pie(data1, chartoption1);
  }
}

$(document).on('click', '.add_prod', function(){
  $('.out_of_stock_msg').hide();
})


$(document).ready(function() {
    $('#print').click(function() {
      var mode = 'iframe';
      var close = mode == 'popup';
      var options = {
          mode: mode,
          popClose: close
      };
      $('div.printableArea').printArea(options);
    });
  });
  function print_page()
  {
    var restorepage = document.body.innerHTML
    var printcontent = document.getElementById(print_data).innerHTML;
    document.body.innerHTML = printcontent;
    window.print();
    document.body.innerHTML = restorepage;
  }

$(document).on('keyup', '#customer_billing_address_attributes_zip, #customer_shipping_address_attributes_zip , #customer_additional_address_attributes_zip, #contact_address_attributes_zip, #contact_address_attributes_zip , #order_shipping_address_attributes_zip', function(){
    var zip_code = $(this).val();
    var $this = $(this)
    if(zip_code ){
      $.ajax({
        url:  "/addresses/get_zip_data",
        data:  {id: zip_code},
        dataType: "json",
        type: "GET",
        success:function(data) {
          if(data.value == 0){
            $this.parents('.main').find('.zipcode_error').removeClass("hidden");
          }
          else{
            $('.zipcode_error').addClass("hidden");
            Object.keys(data)[0]
            var key = Object.keys(data)[0];
            city = data[key];
            Object.keys(data)[1]
            var key = Object.keys(data)[1];
            state = data[key];
            Object.keys(data)[2]
            var key = Object.keys(data)[2];
            country = data[key];
            $this.parents('.main').find('#dropdown_city').val(city);
            $this.parents('.main').find('#dropdown_state').val(state);
            $this.parents('.main').find('#dd_country').val(country);
          }
        }
      });
    }
    else{
      $('.zipcode_error').hide();
      $('#dropdown_city').val(null);
      $('#dropdown_state').val(null);
      $('#dd_country').val(null);

    }
});

$(function() {
    $('.order_status').on('change', saveStatus);
    function saveStatus() {
      var $this = $(this);
      var newStatus = $(this).val();
      var table_row = $(this).closest('tr');
      var currentStatus = table_row.attr('data-status');
      var leadId = table_row.attr('data-id');
      if (!(newStatus == "" && newStatus == currentStatus)) {
        $.ajax({
          url: '/orders/'+ leadId+'/status',
          data: {status: newStatus},
          dataType: "json",
          type: "PUT",
          success:function(data) {
          }
        });
      }
    }
  });
$(document).on('click', '.remove1', function(){
  $('.remove1').hide();
})

$(document).on('click', '.remove2', function(){
  $('.remove2').hide();
})

$(document).on('click', '.remove3', function(){
  $('.remove3').hide();
})
$(document).on('click', '.remove4', function(){
  $('.remove4').hide();
})

$(document).ready(function() {
  $('#product_category_id').select2();
});

