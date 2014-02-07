$(document).ready(function(){
/////////////////////////////

var $repInfo;

$('span.n').on('click', function(event){
  event.preventDefault()
  $repInfo = $(this).closest('div').find('ul')
  $repInfo.toggleClass('hidden')
})

/////////////////////////////
})