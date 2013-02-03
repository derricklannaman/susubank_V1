$(function(){
  // SUSU BUILDER
  $('#susu_builder_form').hide();
  $('#builder_button').click(show_form);

});


function show_form() {
  $('.all_susu_panel').hide(100);
  $('#susu_builder_form').fadeIn(200);
}