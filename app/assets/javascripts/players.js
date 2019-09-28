function setPreview(){
  xOffset = 10;
  yOffset = 165;
                  
  $("a.player_name").hover(function(e){
    $("body").append("<p id='preview'><img src='" + this.name + "' width='105' onerror='this.src=\"https://www.shogi.or.jp/images/player/substitute.png\";'/></p>");
    $("#preview")
    .css("top",(e.pageY - yOffset ) + "px")
    .css("left",(e.pageX + xOffset ) + "px")
    .fadeIn("slow");
  },
  function(){
    $("#preview").remove();
  }); 
  $("a.player_name").click(function(e){
    $("#preview").remove();
  });

  $("a.player_name").mousemove(function(e){
    $("#preview")
    .css("top",(e.pageY - yOffset) + "px")
    .css("left",(e.pageX + xOffset) + "px");
  }); 
};
