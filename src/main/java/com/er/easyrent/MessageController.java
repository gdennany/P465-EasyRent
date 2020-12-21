package com.er.easyrent;

import com.er.easyrent.models.Message;
import com.er.easyrent.models.User;
import com.er.easyrent.repos.MessageRepository;
import com.er.easyrent.repos.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * Handles the messages page
 */
@Controller
public class MessageController {

    @Autowired
    private MessageRepository messageRepository;

    @Autowired
    private UserRepository userRepository;

    //maps id to username from user database
    HashMap<Integer, String> idToUsername = new HashMap<>();

    //current user (hardcoded for now until view specific functionality is completed)
    static int currentUserId;

    /**
     * Renders the messages page
     */
    @RequestMapping(value = "/messages", method = RequestMethod.GET)
    public String messages(ModelMap model, HttpServletRequest req, HttpSession sesh, @RequestParam(required = false, value="userName") String userName) {
        //ensures user is logged in, if not redirect them to login page
        Object yaes = sesh.getAttribute("id");
        if (yaes != null) {
            currentUserId = Integer.parseInt(String.valueOf(yaes));
        } else {
            return "redirect:" + "/login-and-registration";
        }
        if (req.getParameter("who") != null) {
            req.setAttribute("who", userRepository.findById(Long.parseLong(req.getParameter("who"))).get().getUsername());
        }
        Iterable<User> logins = userRepository.findAll();
        Iterable<Message> messages = messageRepository.findAll();
        String userDirectory = "";

        //map id number to username from user repository
        for (User user : logins) {
            userDirectory += user.getUsername() + ",,,";
            idToUsername.put(user.getId().intValue(), user.getUsername());
            /*
            //below is useful if you accidentally change all of the users in the database and have to change them back

            if (user.getId() == 1) {
                user.setUsername("Tao");
                userRepository.save(user);
            }
            if (user.getId() == 2) {
                user.setUsername("Admin");
                userRepository.save(user);
            }
            if (user.getId() == 3) {
                user.setUsername("Grant");
                userRepository.save(user);
            }
            if (user.getId() == 4) {
                user.setUsername("Gopi");
                userRepository.save(user);
            }
            if (user.getId() == 5) {
                user.setUsername("Ramone");
                userRepository.save(user);
            }
            if (user.getId() == 6) {
                user.setUsername("Maazin");
                userRepository.save(user);
            }
            if (user.getId() == 7) {
                user.setUsername("Mozzarella");
                userRepository.save(user);
            }if (user.getId() == 8) {
                user.setUsername("Abdul");
                userRepository.save(user);
            }if (user.getId() == 9) {
                user.setUsername("Rihanna");
                userRepository.save(user);
            }if (user.getId() == 10) {
                user.setUsername("Mitch");
                userRepository.save(user);
            }if (user.getId() == 11) {
                user.setUsername("Kelly");
                userRepository.save(user);
            }
            if (user.getId() == 12) {
                user.setUsername("Phyllis");
                userRepository.save(user);
            }if (user.getId() == 13) {
                user.setUsername("Hugo");
                userRepository.save(user);
            }if (user.getId() == 14) {
                user.setUsername("Jorge");
                userRepository.save(user);
            }
            if (user.getId() == 15) {
                user.setUsername("Holly");
                userRepository.save(user);
            }
            if (user.getId() == 16) {
                user.setUsername("Marcus");
                userRepository.save(user);
            }
            if (user.getId() == 17) {
                user.setUsername("Emily");
                userRepository.save(user);
            }
            if (user.getId() == 18) {
                user.setUsername("Claire");
                userRepository.save(user);
            }
            if (user.getId() == 19) {
                user.setUsername("Mike");
                userRepository.save(user);
            }
            if (user.getId() == 20) {
                user.setUsername("Olivia");
                userRepository.save(user);
            }
            if (user.getId() == 21) {
                user.setUsername("Harshita");
                userRepository.save(user);
            }
            if (user.getId() == 22) {
                user.setUsername("Ellen");
                userRepository.save(user);
            }

             */

        }

/*
        Date nowww = new Date();
        Message message1 = new Message(3, 12, true, "Hello testing", nowww);
        messageRepository.save(message1);

 */
        //TODO: set this hardcoded value to the current active user
        //currentUserId = 3;

        //Holds name of other users that sent/received a message to/from currentUser
        //Key: name of other user that interacted with currentUser
        //Value: ArrayList of < current user sent or received this message, read or unread, message content, time of message >
        //HashMap<String, ArrayList<ArrayList<String>>> userMessages = new HashMap<>();


        HashMap<String, ArrayList<String>> userMessages = new HashMap<>();
        //holds: key -> other users name, value -> last message sent between current and other user for preview on the message board
        HashMap<String, Object[]> messagePreviews = new HashMap<>();
        String messagePreviewContent = "";
        Boolean messagePreviewStatus = false;
        String messagePreviewTimeAgo = "";

        //holds: key -> other users name, value -> if there are unread messages between the currentUser and the other user
        //HashMap<String, Boolean> messageStatus = new HashMap<>();
        //holds: key -> other users name, value -> How long ago the last message was between them
        //HashMap<String, String> messageTimeAgo = new HashMap<>();

        String firstMessageInList;
        if (userName == null) {
            firstMessageInList = "";
        } else {
            firstMessageInList = userName;
        }

        for (Message message : messages) {
            String sentOrReceived = "sent";
            boolean messageToOrFromUser = false;

            /*
            if (message.getId() == 28) {
                message.setSender_id(8);
                messageRepository.save(message);
            }
             */

            //if current user sent or received this message
            if (message.getSender_id() == currentUserId) {
                messageToOrFromUser = true;
            } else if (message.getReceiver_id() == currentUserId) {
                sentOrReceived = "received";
                messageToOrFromUser = true;
            }

            if (messageToOrFromUser) {
                ArrayList<String> currentMessageContent = new ArrayList<>();
                currentMessageContent.add(sentOrReceived);
                if (message.getUnread()) currentMessageContent.add("unread");
                else currentMessageContent.add("read");
                currentMessageContent.add(message.getMessage_content());
                currentMessageContent.add(String.valueOf(message.getDate_time()));

                if (sentOrReceived.equals("sent")) {
                    String toUsername = idToUsername.get(message.getReceiver_id());
                    messagePreviewStatus = message.getUnread();
                    if (userMessages.containsKey(toUsername)) {
                        ArrayList<String> currentMessages = userMessages.get(toUsername);
                        currentMessages.add(currentMessageContent.toString());
                        userMessages.replace(toUsername, currentMessages);
                    } else {
                        ArrayList<String> newMessageThread = new ArrayList<>();
                        newMessageThread.add(currentMessageContent.toString());
                        userMessages.put(toUsername, newMessageThread);
                    }

                    if (message.getMessage_content().length() > 30) {
                        messagePreviewContent = message.getMessage_content().substring(0, 30) + "...";
                    } else {
                        messagePreviewContent = message.getMessage_content();
                    }

                    if (firstMessageInList.equals("")) {
                        firstMessageInList = toUsername;
                    }

                    Date now = new Date();
                    long nowTime = now.getTime();
                    long thenTime = message.getDate_time().getTime();
                    long howLongAgoInMS = nowTime - thenTime;
                    long howLongAgoInMinutes = howLongAgoInMS / 60000;
                    long howLongAgoInHours = howLongAgoInMinutes / 60;
                    if (howLongAgoInMinutes < 60) {
                        messagePreviewTimeAgo = Math.round(howLongAgoInMinutes) + " minutes ago";
                    } else if (howLongAgoInHours < 24) {
                        messagePreviewTimeAgo = Math.round(howLongAgoInHours) + " hours ago";
                    } else {
                        long howLongAgoInDays = howLongAgoInHours / 24;
                        messagePreviewTimeAgo = Math.round(howLongAgoInDays) + " days ago";
                    }

                    messagePreviews.put(toUsername, new Object[]{messagePreviewContent, messagePreviewStatus, messagePreviewTimeAgo});
                } else {
                    String fromUsername = idToUsername.get(message.getSender_id());
                    messagePreviewStatus = message.getUnread();
                    if (userMessages.containsKey(fromUsername)) {
                        ArrayList<String> currentMessages = userMessages.get(fromUsername);
                        currentMessages.add(currentMessageContent.toString());
                        userMessages.replace(fromUsername, currentMessages);
                    } else {
                        ArrayList<String> newMessageThread = new ArrayList<>();
                        newMessageThread.add(currentMessageContent.toString());
                        userMessages.put(fromUsername, newMessageThread);
                    }

                    if (message.getMessage_content().length() > 45) {
                        messagePreviewContent = message.getMessage_content().substring(0, 45) + "...";
                    } else {
                        messagePreviewContent = message.getMessage_content();
                    }

                    if (firstMessageInList.equals("")) {
                        firstMessageInList = fromUsername;
                    }

                    Date now = new Date();
                    long nowTime = now.getTime();
                    long thenTime = message.getDate_time().getTime();
                    long howLongAgoInMS = nowTime - thenTime;
                    long howLongAgoInMinutes = howLongAgoInMS / 60000;
                    long howLongAgoInHours = howLongAgoInMinutes / 60;
                    if (howLongAgoInMinutes < 60) {
                        messagePreviewTimeAgo = Math.round(howLongAgoInMinutes) + " minutes ago";
                    } else if (howLongAgoInHours < 24) {
                        messagePreviewTimeAgo = Math.round(howLongAgoInHours) + " hours ago";
                    } else {
                        long howLongAgoInDays = howLongAgoInHours / 24;
                        messagePreviewTimeAgo = Math.round(howLongAgoInDays) + " days ago";
                    }
                    messagePreviews.put(fromUsername, new Object[]{messagePreviewContent, messagePreviewStatus, messagePreviewTimeAgo});
                }
            }
        }

        TreeMap<Long, String[]> messageThread = new TreeMap<>();
        TreeMap<Long, String[]> allMessages = new TreeMap<>();

        if (firstMessageInList.equals("")) {
            //TODO: tell user there are no messages to show. prompt them to create a new message
        } else {
            for (Message message : messages) {
                //message from another user
                if (message.getSender_id() == currentUserId || message.getReceiver_id() == currentUserId) {
                    if (idToUsername.get(message.getSender_id()).equals(firstMessageInList)) {
                        messageThread.put(message.getId(), new String[]{message.getMessage_content(), "from", getTime(message)});
                    }
                    //message to another user
                    else if (idToUsername.get(message.getReceiver_id()).equals(firstMessageInList)) {
                        messageThread.put(message.getId(), new String[]{message.getMessage_content(), "to", getTime(message)});
                    }

                    if (message.getSender_id() == currentUserId) {
                        allMessages.put(message.getId(), new String[]{message.getMessage_content(), "to", getTime(message), String.valueOf(idToUsername.get(message.getReceiver_id()))});
                    } else if (message.getReceiver_id() == currentUserId) {
                        allMessages.put(message.getId(), new String[]{message.getMessage_content(), "from", getTime(message), String.valueOf(idToUsername.get(message.getSender_id()))});
                    }
                }
            }
        }


        model.addAttribute("userMessages", userMessages);
        //model.addAttribute("messagePreviews", messagePreviews);
        //model.addAttribute("messageStatus", messageStatus);
        //model.addAttribute("messageTimeAgo", messageTimeAgo);
        model.addAttribute("messagePreviews", messagePreviews);
        model.addAttribute("messageThread", messageThread);
        model.addAttribute("allMessages", allMessages);
        model.addAttribute("userDirectory", userDirectory);

        return "direct-messages";
    }

    /**
     * calculates time elapsed from now to when the message was originally sent
     */
    public String getTime(Message message) {
        Date now = new Date();
        long nowTime = now.getTime();
        long thenTime = message.getDate_time().getTime();
        long howLongAgoInMS = nowTime - thenTime;
        long howLongAgoInMinutes = howLongAgoInMS / 60000;
        long howLongAgoInHours = howLongAgoInMinutes / 60;
        if (howLongAgoInMinutes < 60) {
            return Math.round(howLongAgoInMinutes) + " minutes ago";
        } else if (howLongAgoInHours < 24) {
            return Math.round(howLongAgoInHours) + " hours ago";
        } else {
            long howLongAgoInDays = howLongAgoInHours / 24;
            return Math.round(howLongAgoInDays) + " days ago";
        }
    }

    /**
     * Here when the user hits the send message button
     */
    @RequestMapping(value = "/messages", method = RequestMethod.POST, params = {"userInput", "recipient"})
    public String submitLogin(ModelMap model, @RequestParam("userInput") String userInput, @RequestParam("recipient") String recipient) {
        //TODO: update database with new message
        return "direct-messages";

    }

    /**
     * Ajax call that updates the unread field in the database
     */
    @RequestMapping(value = "/messages_ajax", method = RequestMethod.GET)
    public String loginAndRegistration_ajaxCallUpdateRead(ModelMap model, @RequestParam(value="userName") String userName) {
        Iterable<Message> messages = messageRepository.findAll();
        TreeMap<Long, String[]> messageThread = new TreeMap<>();

        //TODO: set currentUserId hardcoded value to the current active user

        //loop updates database to reflect the message as being read
        for (Message message : messages) {
            if (message.getReceiver_id() == currentUserId || message.getSender_id() == currentUserId) {
                if (idToUsername.get(message.getReceiver_id()).equals(userName) || idToUsername.get(message.getSender_id()).equals(userName)) {
                    message.setUnread(false);
                    messageRepository.save(message);
                }
            }
        }
        return "direct-messages";
    }

    /**
     * Ajax call that updates the message database upon user hitting the send message button
     */
    @RequestMapping(value = "/messages_ajaxSend", method = RequestMethod.GET)
    public String loginAndRegistration_ajaxCallUpdateMessage(ModelMap model, @RequestParam(value="userName") String userName, @RequestParam(value="messageContent") String messageContent) {
        Iterable<User> users = userRepository.findAll();
        long toUserID = 0;

        for (User user : users) {
            if (user.getUsername().equals(userName)) {
                toUserID = user.getId();
            }
        }

        //TODO: set currentUserId hardcoded value to the current active user
        Date now = new Date();
        Message message1 = new Message(currentUserId, (int) toUserID, false, messageContent, now);
        messageRepository.save(message1);

        return "direct-messages";
    }
}
