$( document ).ready(function() {

    updateLeftSide("");
    var ls = document.getElementById("messageHeaders").getElementsByTagName("li");

    //default the first message to be the active message on page load
    ls.item(0).className = "active";
    var clickedName = ls.item(0).outerText.split("\n")[1];

    //update header section name and message preview to default first message stuff
    document.getElementById("previewTitle").innerHTML = clickedName;
    document.getElementById("previewMessage").innerHTML = ls.item(0).outerText.split("\n")[2];


    updateRightSide(clickedName);

    var searchInput1 = document.getElementById("searchInput").value;

    console.log(searchInput1);
    if (searchInput1.length > 0) {
        console.log("yyyyy");
        $('.search').click();
        //updateLeftSide(searchInput1);
        //updateRightSide(searchInput1);
    }
});


//updates the "active" class to represent a clicked item on the list
$('ul.messagePreviewList li').click(function (e) {
    //ls is the entire list of elements present in the lef-hand message preview section
    var ls = document.getElementById("messageHeaders").getElementsByTagName("li");
    var clickedIndex = $(this).index();

    var namePreview = document.getElementById("previewTitle").innerHTML;
    var messagePreview = document.getElementById("previewMessage").innerHTML;

    //this loop updates the UI to reflect a user click on a new message from the left-hand side preview section
    for (var i = 0; i < ls.length; ++i) {
      var currentLi = ls.item(i);
      var currentName = currentLi.outerText.split("\n")[1];
      var x = currentLi.outerText.split("\n");
      if (currentLi.className == "active" && clickedIndex != i) {
          currentLi.className = "";
          ls.item(clickedIndex).className = "active";
      }
    }

    var clickedName = ls.item(clickedIndex).outerText.split("\n")[1];


    //update header section name and message preview
    if (clickedIndex < newPreviews.length) {
        document.getElementById("previewTitle").innerHTML = newPreviews[clickedIndex][0];
        document.getElementById("previewMessage").innerHTML = newPreviews[clickedIndex][1];
    } else {
        document.getElementById("previewTitle").innerHTML = clickedName;
        document.getElementById("previewMessage").innerHTML = ls.item(clickedIndex).outerText.split("\n")[2];
    }

    // Updates the UI to represent a read message
    ls.item(clickedIndex).getElementsByTagName("i")[0].className = "";
    //Ajax call to update messages as read from clicked user
    $.ajax({
            //this is the php file that processes the data and send mail
            url : "/messages_ajax?userName=" + clickedName,
            type : "GET",
            //Do not cache the page
            cache : false,
            //login success
            success : function(data) {
                //... your other code
                //location.reload(); //reload the page on the success
                //$("#messageHistory").html(data);
            }
        });

    //calls the updateRightSide function that updates the right-hand message box with the newly selected persons name
    updateRightSide(clickedName);

});

var newPreviews = [];
function updateLeftSide(clickedName) {
    var ls = document.getElementById("messagePreviewList").getElementsByTagName("li");
    var hiddenLs = document.getElementById("hiddenMessagePreviewList").getElementsByTagName("li");
    var holdAllPreviews = [];

    for (var x = 0; x < newPreviews.length; ++x) {
        holdAllPreviews.push(newPreviews[x]);
    }

    for (var i = 0; i < hiddenLs.length; ++i) {
        var currentLi = hiddenLs.item(i);
        var split = currentLi.innerHTML.split("123xyz964");

        var previewUserName = split[0];
        var previewMessageContent = split[1];
        var previewMessageUnread = split[2];
        var previewMessageTimeAgo = split[3];

        holdAllPreviews.push(split);
    }

    for (var j = 0; j < holdAllPreviews.length; ++j) {
        var previewUserName = holdAllPreviews[j][0];
        var previewMessageContent = holdAllPreviews[j][1];
        var previewMessageUnread = holdAllPreviews[j][2];
        var previewMessageTimeAgo = holdAllPreviews[j][3];

        ls.item(j).style.display = "";

        if (clickedName != "" && previewUserName == clickedName) {
            ls.item(j).className = "active";
            document.getElementById("previewTitle").innerHTML = previewUserName;
            document.getElementById("previewMessage").innerHTML = previewMessageContent;
        }
        else ls.item(j).className = "";

        if (previewMessageUnread == "false") {
            ls.item(j).getElementsByTagName("i")[0].className = "";
        }

        ls.item(j).getElementsByTagName("small")[0].innerHTML = previewMessageTimeAgo;
        ls.item(j).getElementsByTagName("h5")[0].innerHTML = previewUserName;
        ls.item(j).getElementsByTagName("small")[1].innerHTML = previewMessageContent;
    }


}

var newMessages = [];
function updateRightSide(clickedName) {
    var ls = document.getElementById("messages").getElementsByTagName("li");
    var hiddenLs = document.getElementById("messageHistory").getElementsByTagName("li");

    var allMessages = [];
    for (var i = 0; i < hiddenLs.length; ++i) {
      var currentLi = hiddenLs.item(i);
      var split = hiddenLs.item(i).innerHTML.split("123xyz964");

      var id = split[0];
      var messageContent = split[1];
      var toFrom = split[2];
      var time = split[3];
      var otherUsersName = split[4];

      allMessages.push(split);
    }

    for (var x = 0; x < newMessages.length; ++x) {
        allMessages.push(newMessages[x]);
    }

    var numMessagesfromNewUser = 0;
    for (var j = 0; j < allMessages.length; ++j) {
        if (allMessages[j][4].valueOf() == clickedName.valueOf()) {
            var id = allMessages[j][0];
            var messageContent = allMessages[j][1];
            var toFrom = allMessages[j][2];
            var time = allMessages[j][3];
            var otherUsersName = allMessages[j][4];

            if (numMessagesfromNewUser < ls.length) {
               ls.item(numMessagesfromNewUser).style.display= "";
               ls.item(numMessagesfromNewUser).getElementsByTagName("div")[0].style.display= "";
                if (toFrom.valueOf() == "to") {
                    ls.item(numMessagesfromNewUser).className = "msg-right";
                    ls.item(numMessagesfromNewUser).getElementsByTagName("img")[0].src = "../../assets/img/sample_avatar1.png";

                } else {
                    ls.item(numMessagesfromNewUser).className = "msg-left";
                    ls.item(numMessagesfromNewUser).getElementsByTagName("img")[0].src = "../../assets/img/sample_avatar2.png";
                }

                ls.item(numMessagesfromNewUser).getElementsByTagName("small")[0].innerHTML = time;
                ls.item(numMessagesfromNewUser).getElementsByTagName("div")[0].getElementsByTagName("div")[0].innerHTML = messageContent;
                numMessagesfromNewUser += 1;
            }
        }
    }

    while (numMessagesfromNewUser < ls.length) {
        ls.item(numMessagesfromNewUser).getElementsByTagName("div")[0].style.display= "none";
        numMessagesfromNewUser += 1;
    }

    //document.getElementById("messageHistory");
    var objDiv = document.getElementById("messageHistory");
     objDiv.scrollTop = objDiv.scrollHeight;
}

//gets the user input when user clicks the send button
$('.btn-send').click(function (e) {
    var userMessage = document.getElementById("userInput").value;
    var ls = document.getElementById("messageHeaders").getElementsByTagName("li");

    for (var i = 0; i < ls.length; ++i) {
        var currentLi = ls.item(i);
        if (currentLi.className == "active") {
            var currentName = currentLi.outerText.split("\n")[1];
            break;
        }
    }

    if (i < newPreviews.length) {
        currentName = newPreviews[i][0];
    }

    if (userMessage.length > 0) {
        var sentMessage = [-1, userMessage, "to", "0 minutes ago", currentName];
        newMessages.push(sentMessage);

        updateRightSide(currentName);
        document.getElementById("userInput").value = "";
    }

    //update database with new message
    $.ajax({
        //this is the php file that processes the data and send mail
        url : "/messages_ajaxSend?userName=" + currentName + "&messageContent=" + userMessage,
        type : "GET",
        //Do not cache the page
        cache : false,
        //login success
        success : function(data) {
            //... your other code
            //location.reload(); //reload the page on the success
            //$("#messageHistory").html(data);
        }
    });

});

//gets the user input to the search box when user clicks the search button
$('.search').click(function (e) {
    var searchInput = document.getElementById("searchInput").value;
    var userDirectory = document.getElementById("userDirectory").value.split(",,,");
    var isUser = false;
    var userAlreadyHasMessages = false;

    var ls = document.getElementById("messagePreviewList").getElementsByTagName("li");
    var names = [];

    //names.push(searchInput);

    for (var x = 0; x < newPreviews.length; ++x) {
        names.push(newPreviews[x][0]);
    }

   for (var z = 0; z < ls.length; ++z) {
       if (ls.item(z).style.display == "") {
           names.push(ls.item(z).getElementsByTagName("h5")[0].innerHTML)
       }
   }

   for (var y = 0; y < names.length; ++y) {
       if (searchInput.valueOf() == names[y].valueOf()) {
           userAlreadyHasMessages = true;
       }
   }

   if (userAlreadyHasMessages) {
       updateLeftSide(searchInput);
       updateRightSide(searchInput);
       document.getElementById("searchInput").value = "";
   }
   else if (searchInput.length > 0) {
        for (var i = 0; i < userDirectory.length; ++i) {
            if (userDirectory[i].valueOf() == searchInput.valueOf()) {
                isUser = true;
                //update header section name and message preview to default first message stuff
                document.getElementById("previewTitle").innerHTML = searchInput;
                document.getElementById("previewMessage").innerHTML = "Start a conversation with " + searchInput + " now. Just send them a message!";

                var prev = [searchInput, "Start a conversation with " + searchInput + " now. Just send them a message!", false, ""];
                newPreviews.push(prev);
                updateLeftSide(searchInput);
                updateRightSide(searchInput);
            }
        }

        if (!isUser) {
            alert("There is no EasyRent account with the username " + searchInput + ". Please try another name");
        }

        document.getElementById("searchInput").value = "";
    }

});

