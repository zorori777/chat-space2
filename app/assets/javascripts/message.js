$(document).on('turbolinks:load', function(){
  function buildHTML(message) {
    console.log(message)
    var uploadImage = "";
      if (message.image) {
        var uploadImage = `<img src="${ message.image}">`;
      } else{
        var uploadImage = "";
      }

    var html = `<div class = "chat-main-message-title">
                  <p class = "chat-main-message-title__name">
                    ${message.name}
                  </p>
                  <p class = "chat-main-message-title__time">
                    ${message.time}
                  </p>
                  <p class = "chat-main-message-title__message">
                    ${message.body}
                  </p>
                    ${uploadImage}
                </div>`;
    return html;

  }

  $('#js-form').on('submit', function(e) {
    e.preventDefault();
    var fd = new FormData($('#js-form').get(0));
    $.ajax({
      type: 'POST',
      url: './messages',
      data: fd,
      dataType: 'json',
      processData: false,
      contentType: false
    })

    .done(function(data) {
      var html = buildHTML(data);
      $('.chat-main-message').append(html);
      $('#js-form')[0].reset();
    })

    .fail(function() {
      alert("帰りなさい");
    });
   return false;
  });

  function auto_message(){
    $.ajax({
      type:'GET',
      url:'./messages',
      dataType:'json'
    })

    .done(function (data){
      var updated_message = $('.chat-main-message-title').length;
      var new_message = data.messages.length;
      var buildmessage ='';
        for(var i = updated_message; i < new_message; i++){
           buildmessage += buildHTML(data.messages[i]);
        };
     $('.chat-main-message').append(buildmessage);
    })
    .fail(function(){
      alert("もうちょい");
    })
  };


  // setInterval(auto_message, 50000);
  var timer = setInterval(function() {
    auto_message();
  }, 5000);

  $(this).on('turbolinks:click', function(){
    clearInterval(timer);
  })
});


