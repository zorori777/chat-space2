$(function() {
  function buildHTML(user) {
    var html = `< li class = "users_name">
                  <class = user_name">
                    ${user.name}
                  </p>
                </li>`;
    return html;

  }

  $('.js-form').on('change', function(e) {
    e.preventDefault();
    var textField = $('.js-form__incre-form');
    var input = textField.val();
    $.ajax({
      type: 'GET',
      url: '/users/search.json',
      data: { keyword: input
      },
      dataType: 'json'
    })
    .done(function(date) {
      console.log(date)
      var html = buildHTML(date);
      $(`.user_list`).append(html);
      $(`#clean_form`)[0].reset();
    })
    .fail(function() {
      alert("帰りなさい");
    });
  return false
  });
});

