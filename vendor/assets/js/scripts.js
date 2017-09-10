var current_parent_page = 'products';
var current_child_page = 'products/new';

var authentication = false;
var limit = 10;

var products = [];
var product = {};
var products_page = 0;

var frequentBuyers = [];

$(document).ready(function () {
	loadCurrentPage();
	initComponents();
	initProductsList();
	initFrequentBuyers();

	$('#'+current_parent_page+' a').click();
})

function initComponents() {
	$('.collapsible').collapsible();
}

function moveToLogin() {
	current_parent_page = 'auth';
	current_child_page = 'auth/login';
	loadCurrentPage();
}

function moveToRegister() {
	current_parent_page = 'auth';
	current_child_page = 'auth/register';
	loadCurrentPage();
}

function moveToForgotPass() {
	current_parent_page = 'auth';
	current_child_page = 'auth/forgot';
	loadCurrentPage();
}

function onLogin() {
	current_parent_page = 'products';
	current_child_page = 'products/list';
	loadCurrentPage();
}

function navigate(parent_page, child_page) {
	current_parent_page = parent_page;
	current_child_page = child_page;

	loadCurrentPage()
}

function loadCurrentPage() {
	var page = './pages/'+current_child_page+'.html';

	$.get(page, function (data) {
		$('#page_view').html(data);
		switch (current_child_page) {
			case 'products/list':
				onProductListPage()
				break;
			case 'products/detail':
				onProductDetailPage()
				break;
			case 'clients/new':
				$('ul.tabs').tabs();
				break;
		}
	})
}

function initProductsList() {
	for (var i=0; i< 30; i++) {
		var item = {
			item_no: 'Item-' + Math.random().toString(36).substring(8),
			name: 'Product-'+ (i+1),
			stock: Math.floor((Math.random() * 20) + 1),
			added: Math.floor((Math.random() * 30) + 1) + ' July 2017',
			short_description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'
		}
		products.push(item);
	}
}

function initFrequentBuyers() {
	var total = Math.floor((Math.random() * 10) + 1);

	for (var i=0; i< total; i++) {
		var item = {
			company: 'Company-' + Math.random().toString(36).substring(10),
			last_purchased: Math.floor((Math.random() * 30) + 1) + ' July 2017',
			quantity: Math.floor((Math.random() * 10) + 1),
		}
		frequentBuyers.push(item);
	}
}

function onProductListPage() {
	products_page = 0;
	product = {};

	loadProducts();
}

function onProductDetailPage() {
	var item_no = document.getElementById('product_name');
	item_no.innerText = product.name;

	var title = document.getElementById('product-title');
	title.innerText = product.name;

	var code = document.getElementById('product-code');
	code.innerText = product.item_no;

	var description = document.getElementById('product-descp');
	description.innerText = product.short_description;

	var stock = document.getElementById('product-stock');
	stock.innerText = product.stock;

	var added = document.getElementById('product-added');
	added.innerText = product.added;

	loadFrequentBuyers();
	loadSalesReport();
}

function loadProducts() {
	if(products_page > 2) {
		return;
	}

	var start = limit * products_page;
	var end = limit *  (products_page + 1);

	var products_list = document.getElementById('products_list');
	for (var i = start; i < end; i++) {
		var row = document.createElement("tr");
		var column1 = document.createElement("td");
		column1.innerText = products[i].item_no;
		row.appendChild(column1);

		var column2 = document.createElement("td");
		column2.innerText = products[i].name;
		row.appendChild(column2);

		var column3 = document.createElement("td");
		column3.innerText = products[i].stock;
		row.appendChild(column3);

		var column4 = document.createElement("td");
		column4.innerText = products[i].added;
		row.appendChild(column4);

		row.id = i;
		row.className += ' cursor-pointer';
		row.onclick = function (event) {
			showProductDetails(event.currentTarget.id);
		}
		products_list.appendChild(row);
	}

	products_page ++;
}

function loadFrequentBuyers() {
	var buyers_list = document.getElementById('frequent_buyers');
	for (var i = 0; i < frequentBuyers.length; i++) {
		var row = document.createElement("tr");
		var column1 = document.createElement("td");
		column1.innerText = frequentBuyers[i].company;
		row.appendChild(column1);

		var column2 = document.createElement("td");
		column2.innerText = frequentBuyers[i].last_purchased;
		row.appendChild(column2);

		var column3 = document.createElement("td");
		column3.innerText = frequentBuyers[i].quantity;
		row.appendChild(column3);

		buyers_list.appendChild(row);
	}
}

function loadSalesReport() {
	var years = ['Aug 19', 'Aug 20', 'Aug 21', 'Aug 22', 'Aug 23', 'Aug 24', 'Aug 25'];
	var sales = [];
	for(var i =0; i < 7; i++) {
		sales.push(Math.floor((Math.random() * 10) + 1));
	}

	var ctx = document.getElementById("sales_chart");
	var myChart = new Chart(ctx, {
	  type: 'line',
	  data: {
	    labels: years,
	    datasets: [
	      {
	      	label: 'Sales',
	        data: sales,
	        lineTension: 0,
	        borderColor: "#3cba9f",
	      }
	    ]
	  }
	});
}

function showProductDetails(product_id) {
	product = products[product_id];
	console.log("showProductDetails "+ product_id);

	navigate(current_parent_page, 'products/detail');
}

