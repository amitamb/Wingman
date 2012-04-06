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
//= require bootstrap
//= require bootstrap-modal

// Removed
// require_tree .

$(function(){
  
  $("#item_text").focus(function(){
    $("#new_item .full-controls").css({'display' : ''});
  });
  
  $("#new_item").submit(function(){
    if ( !$("#item_text").val() ) {
      return false;
    }
    else if ( !$("#item_tag_list_input input[type=checkbox]").is(":checked") ) {
      alert("Assign at least one tag.");
      return false;
    }
    else if ( !$("#item_listeners_input input[type=checkbox]").is(":checked") ) {
      var resp = confirm("You haven't shared this item with anyone. Do you want to continue to simply save it for future use?");
      return resp;
    }
  });

  // Not blurring works actually
  $("#new_item").focusout(function(){
    // Disable
    return;
    if ( !$(this).val() ) {
      $("#new_item .full-controls").css({'display' : 'none'});
    }
  });

  if ( !localStorage["bookmarklet-install-hide"] ) {
    $(".bookmarklet-install").css({ display : "" });
  }
  $("#bookmarklet").on("click mousedown", function(){ 
    localStorage["bookmarklet-install-hide"] = true;
    return false;
  });
  $(".bookmarklet-install .close").click(function(){
    $(".bookmarklet-install").css({ display : "none" });
    localStorage["bookmarklet-install-hide"] = true;
  });
  if( $("#new_item #item_listeners_input .choices-group").find("li").length == 0) {
    $("#new_item #item_listeners_input .choices-group").html("<i>You are not assigned as a wingman to anyone.  Still save them for later use.</i>");
  }

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
  
  $(".comment-new").find("form").submit(function(){
    if ( !$(this).find("#comment_comment").val() ) { return false; }
  });
  
  $(".comment-new").live("keyup", function(e){
    if ( e.which == 13 ) {

      (function(elem){
        setTimeout( function(){
          elem.val("");
          elem.blur();
        }, 10);
      })($(e.target));
      
      

      var $this = $(this);
      var commentable_id = $this.parents(".comments").data("commentable-id");
      var commentable_type = $this.parents(".comments").data("commentable-type");
      //$.()
      //alert( $this.parents(".comments").data("commentable-id") );
    }
  });

});


function getRandomId(range) {
  return Math.floor(Math.random()*( range || 9999999999 ))
}
