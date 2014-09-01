function countWords() {
  var string = $.trim($("textarea").val()),
      words = string.replace(/\s+/gi, ' ').split(' ').length
      chars = string.length;
  if(!chars)words=0;

  $(".word-count").contents().filter(function(){
    return this.nodeType == 3;
  })[0].nodeValue = words
}

function autoSave() {
  var regex = new RegExp("/\d+/g");
  var wordCount = $.trim($(".word-count").html()).match(/\d+/g) 
  var content = $("textarea").val()
  $.post('/update_post', {word_count: wordCount, content: content})
}

$(document).on('page:change', function() {
  $(".word-count").hover(function() {
    $(this).find(".wordz").toggleClass("hidden")
  })

  $(".close").hover(function() {
    $(".save-exit").toggleClass("hidden")
  })

  window.cursorInterval =  setInterval(function() {
    $(".type-cursor").fadeToggle()
  }, 500)

  $("input").focus(function() {
    $(".type-cursor").fadeOut()
    clearInterval(cursorInterval) 
  })

  $("input").blur(function() { 
    window.cursorInterval =  setInterval(function() {
      $(".type-cursor").fadeToggle()
    }, 500) 
  })
  
  // Run this when the page loads so you can get an initial count.
  // Otherwise, the word count will be zero until you start typing again.
  countWords()

  $("textarea").focus().on('input', countWords)
  setInterval(autoSave, 10000)

  $(".close").find("a").click(function() {
    autoSave() 
  })
})
