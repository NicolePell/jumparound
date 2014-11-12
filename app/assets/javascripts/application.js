// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require gmaps
//= require jquery-ui
//= require jquery.modal.min
//= require_tree .

// $('a').click(function(event){
//   event.preventDefault();
//   $(this).modal();
// });

// $(function(){
//   $('a').click(function(event) {
//     event.preventDefault();
//     $.get(this.href, function(html) {
//       $(html).appendTo('body').modal();
//     });
//   });
// });

$(document).ready(function(){

  $('a').click(function(event){
    event.preventDefault();
    $(this).modal();
  });

//   $(document).bind('ajaxError', 'form#new_user', function(event, jqxhr, settings, exception){
//
//     // note: jqxhr.responseJSON undefined, parsing responseText instead
//     $(event.data).render_form_errors( $.parseJSON(jqxhr.responseText) );
//
//   });
//
//   $('#new_user_modal').on('click', function() {
//     var options = {
//       show: true
//     }
//     $('#modal-').modal(options);
//   })
// });
//
// (function($) {
//
//   $.fn.modal_success = function(){
//     // close modal
//     this.modal('hide');
//
//     // clear form input elements
//     // todo/note: handle textarea, select, etc
//     this.find('form input[type="text"]').val('');
//
//     // clear error state
//     this.clear_previous_errors();
//   };
//
//   $.fn.render_form_errors = function(errors){
//
//     $form = this;
//     this.clear_previous_errors();
//     model = this.data('model');
//
//     // show error messages in input form-group help-block
//     $.each(errors, function(field, messages){
//       $input = $('input[name="' + model + '[' + field + ']"]');
//       $input.closest('.form-group').addClass('has-error').find('.help-block').html( messages.join(' & ') );
//     });
//
//   };
//
//   $.fn.clear_previous_errors = function(){
//     $('.form-group.has-error', this).each(function(){
//       $('.help-block', $(this)).html('');
//       $(this).removeClass('has-error');
    // });
  // }


}(jQuery));
