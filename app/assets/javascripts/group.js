$(window).on('load', function() {
  var
  preFunc = null,
  preinput = '',
  input = '',

  ajaxSearch = function(){
    $.ajax({
     type: 'GET',
     url: '/users/search.json',
     data: { keyword: input
     },
      dataType: 'json'
     })

    .done(function(data) {
      var users = data.users;
      user = buildHTML(users)
      })

    .fail(function() {
    alert('帰れ');
    });
  }

  function buildHTML(users) {
    var list = $("#users_list");

    $.each(users, function(i, user) {
      var item = $('<li class="users_name">').append(user.name);
        list.append(item);
    });
    preinput = $(".js-form__incre-form").val();
  };

 $('.js-form__incre-form').on('keyup', function(e) {
  input = $.trim($(this).val());   //前後の不要な空白を削除
    if(preinput !== input){
      clearTimeout(preFunc);
      preFunc = setTimeout(ajaxSearch(input), 500);
    }
    preinput = input;
    $(".users_name").remove();
  });
});
