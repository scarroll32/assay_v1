# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).closest('.field').remove()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  enableLookup = ->
    $wizzardStep = $('.lookup-sequence')
    if $('.cosmics-form .select-cosmic:checked').length > 0
      $wizzardStep.addClass('ready').removeClass('unready')
    else
      $wizzardStep.addClass('unready').removeClass('ready')

  $('.cosmics-form .select-cosmic').on 'change', enableLookup

  $('.wizard .lookup-sequence').on 'click', (e) ->
    if $(@).hasClass('ready')
      $('.cosmics-form').submit()
    else
      e.preventDefault()

  $('#select_all').on 'change', ->
    if $(@).is(':checked')
      $('.cosmics-form .select-cosmic:not(:checked)').prop('checked', true)
    else
      $('.cosmics-form .select-cosmic:checked').prop('checked', false)
    enableLookup()
