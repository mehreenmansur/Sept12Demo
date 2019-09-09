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
            $('form').submit();
        });
    });
});
