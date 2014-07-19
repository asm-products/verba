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
  console.log(wordCount)
  var content = $("textarea").val()
  $.post('/update_post', {word_count: wordCount, content: content})
}

$(document).on('page:change', function() {
  $(".word-count").hover(function() {
    $(this).find(".wordz").toggleClass("hidden")
  })

  // Run this when the page loads so you can get an initial count.
  // Otherwise, the word count will be zero until you start typing again.
  countWords()

  $("textarea").focus().on('input', countWords)
  setInterval(autoSave, 10000)
})
