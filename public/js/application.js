$(document).ready(function() {
  $('#createEvent').submit(function(e) {
    e.preventDefault();
    var url = $('#createEvent').attr('action')
    // console.log(url)
    $.post(url, $('#createEvent').serialize(), function(data) {
      // console.log(data);
      $('#eventsList').prepend(data);
    });
  });

});
