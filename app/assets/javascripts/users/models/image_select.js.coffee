class @ImageSelect
  constructor: (@InputId) ->
    _self = $(@InputId)
    _self.change ->
      file = $(this).prop('files')[0]
      if !file.type.match('image.*')
        $(this).val('')
        $('span').html('')
        return
      reader = new FileReader()
      reader.onload = ->
        _self.css('background-image': 'url(' + reader.result + ')')
      reader.readAsDataURL(file)
