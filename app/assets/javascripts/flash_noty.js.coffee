$ ->
  if $(".flash-data")[0]
    name = $(".flash-data").data "flashname"
    message = $(".flash-data").data "flashmessage"
    noty
      text: "#{message}"
      type: "#{name}"
      timeout: 3000
      layout: 'topCenter'
