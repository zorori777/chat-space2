$(function() {
  function buildHTML(messages) {
    var html = `<li class = "chat-main-message-title">
                  <p class = "chat-main-message-title__name">
                    \${message.name}
                  </p>
                  <p class = "chat-main-message-title__time">
                    \${message.creaed_at}
                  </p>
                  <p class = "chat-main-message-title__message">
                    \${message.body}
                  </p>
                </li>`
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
      $(`.chat-main-message-title`).append(html);
      textField.val('');
    })
    .fail(function() {
      alert('だめよ');
      return false
    });
  });
});
