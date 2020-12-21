//below function handles notifying the user of bad input and initiating sending the email to customer service
document.getElementById('sendMessageButton').addEventListener('click', function() {

    $('#sendContactForm').validate({
                rules: {
                    name: {
                        required: true,
                        minlength: 2
                    },
                    subject: {
                        required: true,
                        minlength: 4
                    },
                    number: {
                        required: true,
                        minlength: 5
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    message: {
                        required: true,
                        minlength: 20
                    }
                },
                messages: {
                    name: {
                        required: "What's your name?",
                        minlength: "your name must consist of at least 2 characters"
                    },
                    subject: {
                        required: "Please enter a subject line",
                        minlength: "Your subject must consist of at least 4 characters"
                    },
                    number: {
                        required: "come on, you have a number, don't you?",
                        minlength: "your Number must consist of at least 5 characters"
                    },
                    email: {
                        required: "Who should we contact?"
                    },
                    message: {
                        required: "Tell us what's on your mind.",
                        minlength: "Please give us more detail!"
                    }
                }

            })



    var message = document.getElementById('message');
    var name = document.getElementById('name');
    var email = document.getElementById('email');
    var subject = document.getElementById('subject');

    console.log(message.value);
    console.log(message.value.length);
    console.log(name.value);
    console.log(email.value);
    console.log(subject.value);

    if (name.value.length >= 2 && subject.value.length >= 4 && email.value.length >= 1 && message.value.length >= 20) {
        document.getElementById("sendContactForm").submit();
    }
});

//below block handles the modal popup notifying the user of a successful/failed inquiry
var modalThird = document.querySelector(".modalThird");
var closeButtonThird = document.querySelector(".close-buttonThird");
var successfulContact = document.getElementById("successfulContact");

console.log(successfulContact);
if (successfulContact.value == "1" || successfulContact.value == "-1") {
    modalThird.classList.toggle("show-modalThird");
}

function toggleModalThird() {
    modalThird.classList.toggle("show-modalThird");
}

function windowOnClick(event) {
    if (event.target === modalThird) {
        toggleModalThird();
    }
}

closeButtonThird.addEventListener("click", toggleModalThird);
window.addEventListener("click", windowOnClick);
