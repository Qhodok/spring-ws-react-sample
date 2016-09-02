<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Hello React</title>
        <script type="text/javascript" src="vendor/react.js"></script>
        <script type="text/javascript" src="vendor/showdown.min.js"></script>
        <script type="text/javascript" src="stomp.js"></script>
        <script type="text/javascript" src="sockjs-0.3.min.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.0.min.js"></script>
    </head>
    <body>
        <div id="content">${content}</div>
        <script type="text/javascript" src="commentBox.js"></script>
        <script type="text/javascript">
            $(function () {
                renderClient(${data});
            });

            var socket = new SockJS("/ws");
            var stompClient = Stomp.over(socket);
            window.onload = function () {
                stompClient.connect({}, function (connectedMesssage) {
                    stompClient.subscribe("/topic/greating", function (frame) {
                        alert(frame.body);
                    });                    
                    stompClient.send("/app/greating", {}, "");
                }, function (errorMessage) {
                    alert("error " + errorMessage);
                });
            };
        </script>
    </body>
</html>