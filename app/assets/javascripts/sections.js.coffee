# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $("#subHeaderWrapper").html($("#subHeaderHTML").html())

# Slide Toggle to show section info on a click to a section image

  slideCounter = 0
  
  $(".section img").on "click", (e) ->
    $("*").stop()
    e.preventDefault()
    sectionCode = $(@).parent().attr("class")
    $("#contentAreaRight").html($("mark.#{sectionCode}").html())
    i = 0
    if slideCounter % 2 == 0
      $("div.section").not("##{sectionCode}").slideToggle ->
        i++
        $("#contentAreaRight").slideToggle() if i == 3
        slideCounter++
    else 
      $("#contentAreaRight").slideToggle ->
        $("div.section").not("##{sectionCode}").slideToggle()
        slideCounter++

# Trigger the image click on clicks to the parent div, and heading element as well

  $("div.section").on "click", (e) ->
    $(e.target).find("img").trigger("click")
  $("div.section h3").on "click", (e) ->
    $(e.target).parent().find("img").trigger("click")
