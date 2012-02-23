// Loads all Bootstrap javascripts
//= require jquery
//=require jquery_ujs 
//= require bootstrap


$(function() {
  $("#flow_group_tokens").tokenInput("/groups.json", {
    crossDomain: false,
    propertyToSearch: "numb_gr",
    prePopulate: $("#flow_group_tokens").data("pre"),
    theme: 'facebock',
    hintText: 'Введите номер группы',
    noResultsText: 'Не найдено',
    searchingText: "Поиск..."
  });
});


$(function() {
    var dates = $( "#item_start_at, #item_finish_at" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 1,
        buttonImageOnly: true,
        changeYear: true,
        showButtonPanel: true,
        onSelect: function( selectedDate ) {
            var option = this.id == "item_start_date" ? "minDate" : "maxDate",
            instance = $( this ).data( "datepicker" ),
            date = $.datepicker.parseDate(
                instance.settings.dateFormat ||
                    $.datepicker._defaults.dateFormat,
                selectedDate, instance.settings );
            dates.not( this ).datepicker( "option", option, date );
        }
    });
});


$(function() {
    var dates = $( "#semester_stsem, #item_finsem" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 1,
        buttonImageOnly: true,
        changeYear: true,
        showButtonPanel: true,
        onSelect: function( selectedDate ) {
            var option = this.id == "item_stsem" ? "minDate" : "maxDate",
            instance = $( this ).data( "datepicker" ),
            date = $.datepicker.parseDate(
                instance.settings.dateFormat ||
                    $.datepicker._defaults.dateFormat,
                selectedDate, instance.settings );
            dates.not( this ).datepicker( "option", option, date );
        }
    });
});
