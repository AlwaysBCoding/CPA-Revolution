# Sends a PUT request every 3 minutes to store the time remaining in the UserTest model
dbTimeRemaining = ->
  time = $("#timer .timer").text()
  $.ajax window.location.href + "?time_remaining=" + time2seconds(time),
    type: "PUT"     
    
#setInterval dbTimeRemaining, 180000    

countDown = ->
  sec = time2seconds($("#timer .timer").text())
  $("#timer .timer").text(seconds2time(--sec))

$ ->
  if $("body").hasClass("user_tests") && $("body").hasClass("show")
    # Initialize Variables
    correctAnswers = $(".correctAnswers").html()
    wrongAnswers = $(".wrongAnswers").html()
    currentTestlet = $(".currentTestlet").html()
    currentQuestion = $(".questionNumber").html()
    
    # Initialize the page [Color the current question, drop the greeting modal]
    $("#page#{currentQuestion} a").addClass("currentQuestion")
    $("#beginTest").modal()
    
    #setInterval countDown, 1000    
    