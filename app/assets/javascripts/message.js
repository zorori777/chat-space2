$(function() {
  function buildHTML(message) {
    var html = ('<p class = "chat-main-message-title__name">'
      , '<p class = "chat-main-message-title__time">', '<p class = "chat-main-message-title__message">')
    return html;
  }

  $('.js-form').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.js-form__chat-main-input__left');
    var message = textField.val();
    $.ajax({
      type: 'POST',
      url: './messages.json',
      data: {
        message: {
          body: message
        }
      },
      dataType: 'json'
    })
    .done(function(date) {
      var html = buildHTML(date);
      $('p.chat-main-message-title__name', 'p.chat-main-message-title__time',
        'p.chat-main-message-title__message').append(html);
      textField.val('');
    })
    .fail(function() {
      alert('だめよ');
      return false
    });
  });
});
