function clickLike(elem){
  if (!$(elem).hasClass('like-button-liked')) {
    $.post('/news/' + $(elem).prop('id') + '/like');
  }
}
