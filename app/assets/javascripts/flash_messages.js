$(document).on('page:change', function() {
  $(".flash-message__close").click(function() {
    $(this).closest("[class^=flash-message--]").fadeOut()
  })
})
