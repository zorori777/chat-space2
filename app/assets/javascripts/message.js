$(document).on('turbolinks:load', function(){
  function buildHTML(message) {
    var uploadImage = "";
      if (message.image) {
        uploadImage = '<img src="' + message.image + '">';
      }

    var html = '<div class = "chat-main-message-title">'
                  '<p class = "chat-main-message-title__name">'
                     ' + message.name + '
                  '</p>'
                  '<p class = "chat-main-message-title__time">'
                    ' + message.time + '
                  '</p>'
                  '<p class = "chat-main-message-title__message">'
                     ' + message.body + '
                  '</p>'
                     ' + uploadImage + '
                '</div>';
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

  function autoMessage(){
    $.ajax({
      type:'GET',
      url:'./messages',
      dataType:'json'
    })

    .done(function (data){
      var updatedMessage = $('.chat-main-message-title').length;
      var newMessage = data.messages.length;
      var buildMessage ='';
        for(var i = updatedMessage; i < newMessage; i++){
           buildMessage += buildHTML(data.messages[i]);
        };
     $('.chat-main-message').append(buildMessage);
    })
    .fail(function(){
      alert("もうちょい");
    })
  };

  setInterval(autoMessage, 10000);

});


