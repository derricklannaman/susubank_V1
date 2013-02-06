$(function(){
  // SUSU BUILDER
  $('#susu_builder_form').hide();
  $('#builder_button').click(show_form);
  $('#dashboard_create_susu_button').hide();
  $('#calculate_button').click(show_susu_create_button);
  // SUSU VIEW
  $('.member_info_box').hide();
  $('.member_info_box, button').on('click', show_member_info);

});

function show_member_info(){
  $(this).parents('.member_box')
         .children('.member_info_box')
         .slideToggle("swing");
}


function show_susu_create_button(){
  $('#dashboard_create_susu_button').show();
}

function show_form() {
  $('.all_susu_panel').hide(100);
  $('#susu_builder_form').fadeIn(200);
}