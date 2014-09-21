$(document).on 'click', 'input[type="checkbox"][data-enable]', ->
  target = "#" + $(this).data('enable')
  if $(this).is(":checked")
    $(target).prop('disabled', false)
  else
    $(target).prop('disabled', true)

