$(function() {
  if ($('#datas_daily').length > 0) {

    // Setting of DateRangePicker 
    $('#picker').daterangepicker({
      singleDatePicker: true,
      showDropdowns: true,
      locale: {
        format: 'YYYY-MM-DD'
      },
      maxDate: moment().add(1, 'y').format('YYYYMMDD'),
      startDate: gon.date
    });

    // When selecting another date
    $('#picker').on('change', function() {
      let date = $(this).val();
      $.ajax({
        url: '/daily',
        method: 'GET',
        dataType: 'script',
        data: {
          date: date
        }
      });
    });
  }
})