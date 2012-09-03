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
    correctAnswers = $(".correctAnswers").text()
    wrongAnswers = $(".wrongAnswers").text()
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
        
    $("#answers .submit").on "click", (e) ->
      e.preventDefault()
      questionNumber = parseInt($(".questionNumber").text())
      correctAnswers = parseInt($(".correctAnswers").text())
      wrongAnswers = parseInt($(".wrongAnswers").text())
      
      unless $("input:radio[name=answer]:checked").length == 0 || $("#page#{questionNumber} a").hasClass("answered")
        answer = $("input:radio[name=answer]:checked").val()
        if answer is "correct" then correctAnswers += 1 else wrongAnswers += 1
        if answer is "correct" then $(".correctAnswers").text("#{correctAnswers}") else $(".wrongAnswers").text("#{wrongAnswers}")
        $.post "/user_test/#{questionNumber}", 
          "answer": answer
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
#    // Go to the next unanswered question
#    if ($(".answered").length + 1 < <%= @testlet1.length %>) {
#      var nextQuestion;
#      var curInterval = 1 + ((testlet - 1) * <%= @user_test.section.questions_per_testlet %>);
#      
#        for (i=0; i<<%= @user_test.section.questions_per_testlet %>; i++) {
#          if (questionNumber+1+i <= testlet * <%= @user_test.section.questions_per_testlet %>) {
#            if($("#page"+(questionNumber+1+i)+" a").hasClass("answered")) {
#              continue;
#            } else {
#              nextQuestion = (questionNumber+1+i);
#              break;
#            } // if the question is unanswered
#          } // if the question < 30
#          else {
#            if($("#page"+curInterval+" a").hasClass("answered")) {
#              curInterval++;
#              continue;
#            } else {
#              nextQuestion = (curInterval);
#              break;
#            }
#          } // else
#
#        } // for 
#    
#    getQuestionJSON(nextQuestion);
#    
#    // Color the just answered question appropriately
#    $("#page"+questionNumber+" a").addClass("answered");
#    answer == "correct" ? $("#page"+questionNumber+" a").addClass("answeredCorrect") : $("#page"+questionNumber+" a").addClass("answeredWrong");
#    
#    } // if it's not the last question
#    
#    else {
#      $("#page"+questionNumber+" a").addClass("answered");
#      $(".correctAnswersModal span").text($(".correctAnswers").text());
#      $(".wrongAnswersModal span").text($(".wrongAnswers").text());
#      $(".answered").removeClass("answered");
#      
#      if (testlet < 3) {
#      $("#endTestlet .testletNumber").text(testlet);
#      $("#endTestlet .testletNumberPlusOne").text(testlet+1);
#      $("#endTestlet").modal();
#      } else {
#        window.location = "/user_test/finish";
#      } // if the test is over
#      
#    } // if it is the last question
#    
#  } // if an answer is selected
#  
#}); // click
#
#); // load        