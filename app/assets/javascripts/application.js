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

// Removed
// require_tree .


$(function(){
  $(function(){
    $("#" + window.nav_id).parents("li").toggleClass("active");
  });

  $(".choice input.tag_input").each(function(){
    var $this = $(this);
    if ( $this.is(':checked') ) {
      $this.parents("li").toggleClass("selected");
      // css({ "background-color" : "White", "border-style" : "dotted" });
    }
    else
    {
      //$this.parents("li").toggleClass("selected");
      //$this.parents("li").css({ "background-color" : "White", "border-style" : "dotted" });
    }
  });
  $(".choice").on("click", "input.tag_input", function(){
    var $this = $(this);
    $this.parents("li").toggleClass("selected");
  });
  
  $(".btn-wingman-request").click(function(e){
    var message = prompt("Write short message on how you need help?");
    if (!message) { return false; }
    $(this).attr("href", $(this).attr("href") + "&message=" + encodeURIComponent(message) );
    //e.preventDefault();
    //return false;
  });

});
