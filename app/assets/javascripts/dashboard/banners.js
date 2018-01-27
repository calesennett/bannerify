$('.banner').click(function(e) {
  e.preventDefault();
  var el       = $(this);
  var bannerID = el.attr('data-banner-id');

  $.ajax({
    method: "PATCH",
    url: "/banners/" + bannerID,
    data: {
      banner: {
        current: true
      }
    },
    success: function(data) {
      if (data.saved) {
        $('.banner').removeClass('current bg-green white');
        el.removeClass('bg-white').addClass('current bg-green white');
      } else {
        alert('Failed to set active banner. Please try again.');
      }
    }
  });
});

$('.banner-style').click(function(e) {
  e.preventDefault();

  debugger;

  var el          = $(this);
  var bannerID    = $('.banner.current').attr('data-banner-id');
  var bannerStyle = el.attr('data-banner-style');

  $.ajax({
    method: "PATCH",
    url: "/banners/" + bannerID,
    data: {
      banner: {
        style: bannerStyle
      }
    },
    success: function(data) {
      if (data.saved) {
        $('.banner-style').removeClass('current-style bg-green white');
        el.removeClass('bg-white').addClass('current-style bg-green white');
      } else {
        alert('Failed to set banner type. Please try again.');
      }
    }
  });
});
