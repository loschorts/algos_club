# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@toggleAnswer = (e) ->
  e.preventDefault()
  if $(".answers").hasClass("hide")
    e.target.text = "Hide Answers"
  else
    e.target.text = "Show Answers"
  $(".answers").toggleClass("hide")
