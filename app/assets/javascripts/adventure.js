var scrolled = 0;

var scrollToImages = function() {
	scrolled += $('#tagline').parent().height();
	$('body').scrollTop($('#tagline').parent().height() - $('#header').height() *3 + 2);
}


$(document).ready(function() {
	$('body').on('click', '#compass a', scrollToImages);
  $('#compass').mouseenter(function(){
    $(this).css('font-size',70);
  }).mouseleave(function(){
    $(this).css('font-size',60);
  })
})