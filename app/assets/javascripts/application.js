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
//= require_tree .

$(function() {
  $('#filters').on('change', '#state_filter', function(e) {
    out_by_filters();
  });
});

$(function() {
  $('#filters').on('change', '#assigner_filter', function(e) {
    out_by_filters();
  });
});

$(function() {
  $('#filters').on('change', '#assignee_filter', function(e) {
    out_by_filters();
  });
});

function out_by_filters(){
  var state = $('#state_filter')[0].value;
  var assigner = $('#assigner_filter')[0].value;
  var assignee = $('#assignee_filter')[0].value;
  $.ajax({
    url: '/out_by_filters',
    type: 'GET',
    data: {state_option: state, assigner_option: assigner, assignee_option: assignee},
    dataType: 'script',
    async: true,

    success: function(data, textStatus, jqXHR) {
    
    },
    error: function(request, textStatus, errorThrown) {
      console.log(request);
      console.log(textStatus);
      console.log(errorThrown);
    }
  });
}
