$('.banner').click(function(e) {
  e.preventDefault();
  var el       = $(this);
  var bannerID = el.attr('data-banner-id');

  $.ajax({
    method: "PATCH",
    url: "/banners/" + bannerID,
    data: {},
    success: function(data) {
      if (data.saved) {
        $('.banner').removeClass('bg-green white');
        el.removeClass('bg-white').addClass('bg-green white');
      } else {
        alert('Failed to set active banner. Please try again.');
      }
    }
  });
});
