changeToQuestion = (questionID, questionNumber) ->
  $("#pagination a").removeClass("currentQuestion")
  $.getJSON "/topic/?question=#{questionID}", 
    (data) ->
      $(".choices").html("")
      $("#questionText").html(data.question.question_text)
      $(".questionSource").text(data.question.source)
      $(".topicName").text(data.topic.name)
      $(".questionNumber").text(questionNumber)

      $.each data.answers, (index, item) ->
        value = if item.correct? then "correct" else "wrong"
        $(".choices").append("<li><input type='radio' id='choice#{index+1}' name='answer' value='#{value}' /><a><label for='choice#{index+1}'>#{item.answer_text}</label></a></li>")

    $("#answers form").attr("action", "/topic/#{questionID}")
    $("#page#{questionNumber} a").addClass("currentQuestion")  
    
$ ->
  $(".page a").on "click", ->
    if not $(@).hasClass("answered")
      questionID = $(@).attr("id")
      questionNumber = $(@).parent().attr("id").replace("page", "")
      changeToQuestion(questionID, questionNumber)    