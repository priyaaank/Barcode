$(function() {
  var faye = new Faye.Client("http://pipefaye.herokuapp.com/faye");
  faye.subscribe('/new', function(data) {
    alert(data);
  });
});

$(document).ready(function() {
  
  fetch_messages = function() {
    $.get("http://localhost:3000/rooms/1/chats/1.js", null, null, "script");
  }

  $("#refresh_button").click(function() {
    fetch_messages();
  });

});
