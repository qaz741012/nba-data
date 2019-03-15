$(document).on('turbolinks:load', function() {
  if ($('#players_show').length > 0) {
    // show detail
    $('.show_detail_btn').on('click', function() {
      $('.detail').css('display', 'table-cell');
      $('.table').addClass('all');
      $('.table').removeClass('few');
      $(this).addClass('d-none');
      $('.hide_detail_btn').removeClass('d-none');
    });

    // hide detail
    $('.hide_detail_btn').on('click', function() {
      $('.detail').css('display', 'none');
      $('.table').removeClass('all');
      $('.table').addClass('few');
      $(this).addClass('d-none');
      $('.show_detail_btn').removeClass('d-none');
    });

    // recent ? games
    $('.input_area input').on('keyup', function() {
      let limit = $(this).val() ? $(this).val() : undefined;
      $.ajax({
        url: `/players/${gon.player_id}`,
        method: 'GET',
        data: {
          limit: limit
        },
        dataType: 'script'
      });
    });

    // select opponent
    $('#opponent_select').select2({
      width: '100%'
    });
  }
});