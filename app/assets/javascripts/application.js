//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require bootstrap-sprockets
//= require moment
//= require bootstrap-datetimepicker
//= require turbolinks
//= require cocoon
//= require date_time_picker.js
//= require_tree .

jQuery(document).ready(function($){
    $(document).on('turbolinks:load', function () {
        $('.btn-save-and-cont').on('click', function () {
            $('#form_type').val('save');
            $('form').submit();
        });
        $('.btn-need-things').on('click', function () {
            $('#form_type').val('things');
            $('form').submit();
        });
        $('.btn-need-people').on('click', function () {
            $('#form_type').val('people');
            $('form').submit();
        });

        // $('.btn-save-and-cont').on('click', function () {
        //     // $('#fuel_type_field').val('people');
        //     $('#fuel_type_field').val('save');
        //     $('form').submit();
        // });

    });
});
