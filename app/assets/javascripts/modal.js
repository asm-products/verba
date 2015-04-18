$(document).on('page:change', function() {
  $(".modal, .big-modal").find(".close").click(function() {
    $(".overlay, .modal, .big-modal").addClass("hidden");
  })
})
