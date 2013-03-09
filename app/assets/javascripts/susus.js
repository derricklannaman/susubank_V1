$(function(){
  // SUSU BUILDER
  $('#susu_builder_form, #dashboard_create_susu_button, .member_info_box,\
     .global_stats').hide();
  $('#builder_button').on('click', show_form);
  $('#calculate_button').on('click', show_susu_create_button);
  // SUSU VIEW
  $('button.member_info_button').on('click', function(){
      var member_info = $(this);
       member_info.parents('.member_box')
                .children('.member_info_box')
                  .fadeToggle(500)
    });

  // FAQ ON SUSU 101 page
    // Controls the animation of the questions
  $('dd').filter(':nth-child(n+4)').hide();
  $('dl').on('mouseenter', 'dt', function(){
      $(this).next()
          .slideDown(400)
            .siblings('dd')
              .slideUp(400)
    });

    // Animates buttons on the stats page when clicked
    $('.button_plate').on('click', function(){
        var $this = $(this).parent()
          global_stats = $('.global_stats');

            $this.prevUntil('.data_group').slideToggle(700);
            $this.nextUntil('.box_score').slideToggle(700);
              global_stats.delay(500).fadeToggle(330);
    });
    // Animate opening tag on page load
      var opening_tag = $('#opening_tag');
      opening_tag.hide();
      $(window).load(function(){
        opening_tag.removeClass('tag_opacity').addClass('open_fade_in').fadeIn(200);
        opening_tag.animate({"left": "+=30px"}, 1000);
      });

    // Makes member list sortable by dragging
      $('#order_members').sortable();
      $('#order_members').disableSelection();


});


function show_susu_create_button(){
  $('#dashboard_create_susu_button').show();
}

function show_form() {
  $('.all_susu_panel').hide(100);
  $('#susu_builder_form').fadeIn(200);
}
















