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
//= require bootstrap
//= require jquery_ujs
//= require_tree .

$(function() {

  $('a.character_link').popover();
  $('a.pinyin_link').popover();
  $('a.english_translation_link').popover();


  $(".alert").delay(1500).fadeOut(1000);

  // $("#view_sample_flashcard").click(function() {
  //   $("html, body").animate({ scrollTop: $(document).height() }, "slow");
  //   return false;

  //   $("button").click(function () {
  //     $(this).toggleClass("active");
  //   });

  // });

} );

  $(document).ready(function(){
      resizeDiv();
  });

  window.onresize = function(event) {
      resizeDiv();
  };

  function resizeDiv() {
      vpw = $(window).width(); 
      vph = $(window).height(); 
      $('#somediv').css({'height': vph + 'px'});
  };
