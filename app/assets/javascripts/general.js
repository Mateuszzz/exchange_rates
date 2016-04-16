$(document).on('ready page:load', function () {
    
   $('#search').datepicker({
      dateFormat : 'yy-mm-dd',
      beforeShowDay: $.datepicker.noWeekends,
      maxDate: '0',
      minDate: '2005-01-01',
      changeYear: true
   });
   
  $('#calculate').click(function() {
   var amount = parseFloat($("#amount").val().replace(",",".")).toFixed(2);
   
   if (isNaN(amount)) {
      $("#amount").val("");
      $(".result").html("");
   }
   
   else{
      var target_currency = ($("#target_currency").val()).replace(",",".");
      var current_currency = ($("#current_currency").val()).replace(",",".");
   
      var target_conversion = $("#target_currency").find('option:selected').attr('id');
      var current_conversion = $("#current_currency").find('option:selected').attr('id');
      
      var target_code = $("#target_currency").find('option:selected').attr('class');
      var current_code = $("#current_currency").find('option:selected').attr('class')
      
      var conversion = ((current_currency / current_conversion) / (target_currency / target_conversion));
      var result = (conversion*amount).toFixed(2);
     
     $(".result").html(
         '<div class="title">' +
            'Result' +
         '</div>' +
            amount + " " + current_code + " = " + result + " " + target_code  
           
      )
      $("#amount").val(amount);   
   }
   
  });
});