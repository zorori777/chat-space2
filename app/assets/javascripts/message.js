$(function() {
  function buildHTML(message) {
    var html = $('<div class = "chat-main-message-title">').append(message.content);
    return html;
  }

  $('.js-form').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.js-form__chat-main-input__left');
    var message = textField.val('');
    $.ajax({
      type: 'POST',
      url: '/groups/:group_id/messages.json',
      data: {
        message: {
          content: message
        }
      },
      dataType: 'json'
    })
    .done(function(date) {
      var html = buildHTML(date);
      $('.chat-main-message-title__name', '.chat-main-message-title__time',
        '.chat-main-message-title__message').append(html);
      textField.val('');
    })
    .fail(function() {
      alert('だめよ');
    });
  });
});
