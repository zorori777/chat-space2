$(window).on('load', function() {
  var
  preFunc = null,
  preInput = '',
  input = '',
  ajaxSearch = function() {

    $.ajax({
      url: "/users/search.json",
      type: "GET",
      data: { "keyword=" + input }
      datetype: 'json'
    });
  };

  $(function() {
  function buildHTML(user) {
    var html = `< li div class = "users_name">
                  < class = user_name">
                    ${message.name}
                  </p>
                  <p class = "chat-main-message-title__time">
                    ${message.time}
                  </p>
                  <p class = "chat-main-message-title__message">
                    ${message.body}
                  </p>
                </div>`;
    return html;
  }

  $('.js-form').on('keyup', function(e) {
    e.preventDefault();
    var textField = $('.js-form__incre-form');
    var user = textField.val();
    input = $.trim(user.val());
    if(preInput !== input){
      clearTimeout(preFunc);
      preFunc = setTimeout(ajaxSearch, 500);
    }
    preInput = input;
  });

    .done(function(date) {
      var html = buildHTML(date);
      $(`.user_lists`).append(html);
      $(`#clean_form`)[0].reset();
    })
    .fail(function() {
      alert("帰りなさい");
    });
  return false
  });
});
