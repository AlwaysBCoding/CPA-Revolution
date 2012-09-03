# Sends a PUT request every 3 minutes to store the time remaining in the UserTest model
dbTimeRemaining = ->
  time = $("#timer .timer").text()
  $.ajax "/user_test/?time_remaining=" + time2seconds(time),
    type: "PUT"     
    
#setInterval dbTimeRemaining, 180000    

countDown = ->
  sec = time2seconds($("#timer .timer").text())
  $("#timer .timer").text(seconds2time(--sec))

changeToQuestion = (questionNumber) ->
  $("#pagination a").removeClass("currentQuestion")
  $.getJSON "/user_test/?question=#{questionNumber}",
    (data) ->
      $(".choices").html("")
      $("#questionText").html(data.question.question_text)
      $(".questionSource").text(data.question.source)
      $(".topicName").text(data.topic.name)
      $(".questionNumber").text(questionNumber)
      
      $.each data.answers, (index, item) ->
        value = if item.correct? then "correct" else "wrong"
        $(".choices").append("<li><input type='radio' id='choice#{index+1}' name='answer' value='#{value}' /><a><label for='choice#{index+1}'>#{item.answer_text}</label></a></li>")
           
  $("#answers form").attr("action", "/user_test/#{questionNumber}")
  $("#page#{questionNumber} a").addClass("currentQuestion")

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
    
    $(".page a").on "click", ->
      if not $(@).hasClass("answered")
        questionNumber = $(@).text()
        changeToQuestion(questionNumber)