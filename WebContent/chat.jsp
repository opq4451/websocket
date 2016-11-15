<%@ page language="java" contentType="text/html;charset=UTF-8" %>

<html>
<head>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script>
    var url = "ws://localhost:8080/websocket/chat";
    var socket = null;
    $(document).ready(function() {
        socket = new WebSocket(url);
        socket.onmessage = handleMsg;
    });
    function handleMsg(event) {
        var msgJObj = $('#messages');
        msgJObj.val(msgJObj.val() + event.data + "\n");
        msgJObj.scrollTop(msgJObj[0].scrollHeight);
    }
   
    function disconnect() {
        socket.close();
    }

    function sendMessage() {
        var msg = $('#input').val();
        socket.send(msg);
        $('#input').val('');
    }
</script>
</head>
<body>

<textarea cols="100" rows="10" id="messages"></textarea>
<br>
<input type="text" id="input" onKeyUp="if(event.keyCode == 13) sendMessage()" />
<input type="button" value="送出" onClick="sendMessage()" />
</body>

</html>