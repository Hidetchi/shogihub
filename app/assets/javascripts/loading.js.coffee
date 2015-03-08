$(document).on 'page:fetch', ->
  topY = ($(window).height()/2 + $(window).scrollTop()) + 'px'
  $("body").spin({top:topY,left:'50%',length:45,radius:10,width:9,color:'#980'});
$(document).on 'page:change', ->
  $("body").spin(false);
$(document).on 'page:load', ->
