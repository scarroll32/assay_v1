###
jQuery ->

  checkBatchStatus = (url, bStep, bStatus) ->
    $.ajax(
      type: "GET",
      url: url,
      dataType: "json",
      success: (data) ->
        if (bStep != data.batch_step) || (bStatus != data.batch_status)
          location.reload();
    )

  if $('#wizard').length > 0
    states = ['locate', 'primer3']
    if $.inArray($('#wizard').data('state'), states) != -1
      url = $('#wizard').data('batch_state_path')
      currentStep = $('#wizard').data('step')
      currentStatus = $('#wizard').data('status')
      setInterval ->
        checkBatchStatus url, currentStep, currentStatus,
        1000;
###



