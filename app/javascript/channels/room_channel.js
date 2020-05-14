import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    var node2 = document.createElement("br"); 
    var node = document.createElement("p");
    var node3 = document.createElement("h6"); 
    
    var textnode = document.createTextNode(data.content.content);
    var textnode1 = document.createTextNode(gon.current_user_email); 
    node2.appendChild(textnode); 
    node3.appendChild(textnode1); 
    node.appendChild(textnode); 
    document.getElementById("new_message").appendChild(node3);
    document.getElementById("new_message").appendChild(node);
    document.getElementById("new_message").appendChild(node2);
    
    document.getElementById('chat_message1').value= ''
    var element = document.documentElement;
    var bottom = element.scrollHeight - element.clientHeight;
    window.scroll(0, bottom);
    // Called when there's incoming data on the websocket for this channel
  }
  
});
