# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  if $("body").hasClass("sections") and $("body").hasClass("index")
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
        slideCounter++
        $("div.section").not("##{sectionCode}").slideToggle ->
          i++
          $("#contentAreaRight").slideToggle() if i == 3
      else
        slideCounter++
        $("#contentAreaRight").slideToggle -> 
          $("div.section").not("##{sectionCode}").slideToggle()

  # Trigger the image click on clicks to the parent div, and heading element as well

    $("div.section").on "click", (e) ->
      $(e.target).find("img").trigger("click")
    $("div.section h3").on "click", (e) ->
      $(e.target).parent().find("img").trigger("click")

$ ->
  if $("body").hasClass("sections") and $("body").hasClass("show")
    $("#subHeaderWrapper").html($("#subHeaderHTML").html())
    
    $("#topicsTable td").on "click", (e) ->
      $(e.target).find("input").trigger("click")
      
    $("#selectAll").on "click", (e) ->
      $(e.target).parents("#topicsTable").find('input').attr('checked', true)
      $("input").trigger("change")
      
    $("#unselectAll").on "click", (e) ->
      $(e.target).parents("#topicsTable").find('input').attr('checked', false)
      $('input').trigger('change')