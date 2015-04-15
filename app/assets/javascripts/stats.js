$(document).on('page:change', function() {
  $(".day-cell").hover(function() {
    $(this).find(".word-count-for-day").removeClass("hidden")
  }, function() {
    $(this).find(".word-count-for-day").addClass("hidden")
  })
})
