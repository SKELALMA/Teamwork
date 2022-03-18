
$(window).scroll(function(){
    var scrollTop = $(document).scrollTop();
    if (scrollTop < 70) {
     scrollTop = 70;
    }
    $(".qnb").stop();
    $(".qnb").animate( { "top" : scrollTop });
    });
