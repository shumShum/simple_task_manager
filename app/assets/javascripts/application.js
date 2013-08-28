// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require cocoon
//= require_tree .

$(document).ready(function() {
  var new_comment_form = $('#new_story_comment');
  var reply_link = $('.reply_comment');
  var root_link = $('.add_root_comment');
  var parent_field = $('#story_comment_parent_id');

  reply_link.click(function(){
    $(this).after(new_comment_form);
    root_link.show();
    parent_field.val($(this).attr('data_id'));
  });

  root_link.click(function(){
    $(this).after(new_comment_form);
    root_link.hide();
    parent_field.val($(this).attr(''));
  });
});