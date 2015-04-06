$(document).on('page:change', function() {
  $(".exit").hover(function() {
    $(".save-exit").toggleClass("hidden")
  })

  $(".js-prompt-modal").click(function() {
    $(".overlay, .modal").removeClass("hidden");
  })

  $(".modal").find(".close").click(function() {
    $(".overlay, .modal").addClass("hidden");
  })

  $(".save-button").click(function() {
    var postContent = $("#writing-textarea").val();
    $.ajax({
      type: "PATCH",
      url: "/posts/" + $("form").data("id"),
      data: {
        post: {
          content: postContent,
        }
      }
    })
  })

  fadeWhenTyping();


  // Run this when the page loads so you can get an initial count.
  // Otherwise, the word count will be zero until you start typing again.
  countWords()

  $("textarea").focus().on('input', countWords)
})

function fadeWhenTyping() {
  var pressed = false;
  var timer = null;
  $("#writing-textarea").keydown(function() {
    if(pressed === true) {
      window.clearTimeout(timer);
      timer = setTimeout(function() {
        pressed = false
        $(".js-willFade").animate({
          opacity: 1
        }, 500)
      }, 1000)
      return true;
    }

    pressed = true;
    window.clearTimeout(timer);
    timer = setTimeout(function() {
      pressed = false
      $(".js-willFade").animate({
        opacity: 1
      }, 500)
    }, 1000)

    $(".js-willFade").animate({
      opacity: 0.1
    }, 500)
  })
}

function countWords() {
  var string = $.trim($("textarea").val()),
      words = string.replace(/\s+/gi, ' ').split(' ').length
      chars = string.length;
  if(!chars)words=0;

  $(".word-count").contents().filter(function(){
    return this.nodeType == 3;
  })[0].nodeValue = words
}
