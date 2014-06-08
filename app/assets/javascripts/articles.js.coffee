# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
    $('#fileupload').fileupload
        dataType: 'json'
        progressall: (e, data)->
            progress = parseInt(data.loaded / data.total * 100, 10)
            $('.progress .progress-bar').css('width', "#{progress}%")
        
    $(document).bind 'dragover': (e) ->
        dropZone = $('#dropzone'); timeout = window.dropZoneTimeout

        if(!timeout)
            dropZone.addClass('in')
        else
            clearTimeout(timeout)

        found = false; node = e.target;
        loop
            if( node is dropZone[0])
                found = true
                break;
            node = node.parentNode
            break if(node isnt null)
        if(found)
            dropZone.addClass('hover')
        else
            dropZone.removeClass('hover')

        window.dropZoneTimeout =
            setTimeout ->
                window.dropZoneTimeout = null;
                dropZone.removeClass('in hover');
            , 100

    

