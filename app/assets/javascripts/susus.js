$(function(){
  // SUSU BUILDER
  $('#susu_builder_form').hide();
  $('#builder_button').click(show_form);
  $('#dashboard_create_susu_button').hide();
  $('#calculate_button').click(show_susu_create_button);
});


function show_susu_create_button(){
  $('#dashboard_create_susu_button').show();
}

function show_form() {
  $('.all_susu_panel').hide(100);
  $('#susu_builder_form').fadeIn(200);
}