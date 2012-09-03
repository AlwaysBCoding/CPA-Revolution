# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  if $("body").hasClass("user_tests") && $("body").hasClass("show")
    # Initialize Variables
    correctAnswers = $(".correctAnswers").html()
    wrongAnswers = $(".wrongAnswers").html()
    currentTestlet = $(".currentTestlet").html()