// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require bootstrap
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(function() {
	var $noMatch = $('#noMatch');
	var $search = $('#search');
	var $panels = $('.panel h3 a');
	var $panelsVisible = $('.panel:visible');
	$noMatch.hide();
	// $noMatch.text($panels.size());

	$search.on('keyup', function() {
		var valThis = this.value.toLowerCase(), 
		    length = this.value.length; 

		$panels.each(function () {
			var text = $(this).text(),
				textL = text.toLowerCase(),
				index = textL.indexOf(valThis);

				index >= 0 ? $(this).parent().parent().parent().show() : $(this).parent().parent().parent().hide();
				$('.panel:visible').length === 0 ? $noMatch.show() : $noMatch.hide();
		});
	});

	$('.alert').delay(4000).fadeOut();

});