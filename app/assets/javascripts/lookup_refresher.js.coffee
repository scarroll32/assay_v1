###
window.startLookupRefresher = (id) ->
  lookup = ->
    $.getJSON "/wizards/locate/#{id}.json", (data) ->
      if data.status == "ready"
        location.href = "/wizards/configure/#{id}"
      else
        setTimeout lookup, 4000
  lookup()
###