$(document).on('turbolinks:load', function() {


  function buildSearchedUserHTML(user) {
    var html =
      `<div class="chat-group-form__field--right">
        <a id = "user" hidden ="${user.id}" name ="user_name" ></a>

        <p class="chat-group-user__name">
          ${user.name}
        </p>

        <a class="chat-group-user__add-button" data-user_id="
            ${user.id}"
           data-user_name="${user.name}">追加</a>
      </div>`
    return html;
  }

  function buildAddedUserHTML(name, id) {
    var html =
      `<div class="chat-group-form__field--right">
        <input type="hidden" name="group[user_ids][]" value=" ${id} ">
        <p class="chat-group-user__name">
          ${name}
        </p>
          <a class="chat-group-user__delete-button">削除</a>
      </div>`
    return html;
  }

  $('#user-search-field').keyup(function() {
    word = $('#user-search-input').val();
    $.ajax({
      type: 'GET',
      url: '/users/search',
      data: { keyword: word },
      dataType: 'json'
    })
    .done(function(data) {
        var responseHTML = "";
        var users = data.users
      if (word.length !== 0 ){
        $.each (users, function(i, user){
          responseHTML += buildSearchedUserHTML(user);
        });
      };
        $('#user-search-result').html(responseHTML);
    })
    .fail(function(data) {
      alert('エラーが発生しました');
    })
  });

  $('#user-search-result').on('click', '.chat-group-user__add-button',function() {
    var $user = $(this);
    var name = $user.data('user_name');
    var id = $user.data('user_id');
    var responseHTML = buildAddedUserHTML(name, id);
    $('#user-add-list').append(responseHTML);
      $user.parent('.chat-group-form__field--right').remove();
    });

  $('#user-add-list').on('click', '.chat-group-user__delete-button',function(){
    var $user = $(this);
    var id = $user.data('user_id');
    $user.parent('.chat-group-form__field--right').remove();
    })
  });

