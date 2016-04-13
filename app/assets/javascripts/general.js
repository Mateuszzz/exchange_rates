$(document).on('ready page:load', function () {
    
   $('#search').datepicker({
        dateFormat : 'yy-mm-dd',
        beforeShowDay: $.datepicker.noWeekends,
        maxDate: '0',
        minDate: '2002-01-01'
   });
});