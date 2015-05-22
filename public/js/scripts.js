$(document).ready(function(){
  var currentIndex = 0,
  items = $('.container1 div'),
  itemAmt = items.length;
  var autoSlide;

  slide();

  function cycleItems(){
    var item = $('.container1 div').eq(currentIndex);
    items.hide();
    item.css('display', 'inline-block');
  }

  function slide() {
    autoSlide = setInterval(function () {
      currentIndex += 1;
      if (currentIndex > itemAmt - 1) {
        currentIndex = 0;
      }
      cycleItems();
    }, 8000);
  }

  $('.next').click(function () {
    currentIndex = currentIndex + 1;
    if (currentIndex > itemAmt - 1) {
      currentIndex = 0;
    }
    cycleItems();
    slide();
  });

  $('.prev').click(function () {
    clearInterval(autoSlide);
    currentIndex = currentIndex - 1;
    if (currentIndex < 0) {
      currentIndex = itemAmt - 1;
    }
    cycleItems();
    slide();
  });
})
