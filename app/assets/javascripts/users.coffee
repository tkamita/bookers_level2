# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("#user_postcode").jpostal({
    postcode : [ "#user_postcode" ],
    address  : {
                  "#user_address" : "%3%4%5%6%7",
                }
  })


