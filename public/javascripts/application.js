$(function() {
  var faye = new Faye.Client("http://pipefaye.herokuapp.com/faye");
  faye.subscribe('/new', function(data) {
    alert(data);
  });
});

$(document).ready(function() {


  //BEGIN of message object

  messages = {
    fetch: function() {
      $.get("http://localhost:3000/rooms/1/messages/1.js", null, null, "script");
    },

    attach: function(sender, message) {
      dom_structure =  "<div class='message'><div class='block'><div class='sender'><h6>"+
                       sender +
                       "</h6></div><div class='text'><h6>" +
                       message +
                       "</h6></div><div class='controls'><h6>"+
                       "Just Now" +
                       "</h6></div></div></div>"
      $("#chat-area").append(dom_structure);
    },

    send: function(url, data) {
      $.post(url, data, null)
        .success(function(data) { messages.attach(data.sender, data.message); })
        .error(function(error) { messages.attach("Server", error.responseText); }
      );
    },
  };
 
  $("#refresh_button").click(function() {
    messages.fetch();
  });


  //END of message object


  $("#message_box").submit(function() {
    messages.send($(this).attr("action"), $(this).serialize());
    return false;
  });


});
