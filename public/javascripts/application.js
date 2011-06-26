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

    send: function(url, data) {
      $.post(url, data, this.success);
    },

    success: function(data) {
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
