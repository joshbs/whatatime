// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function () {
    var pageControlOpen = false;

    $.fn.clear = function () {
        $(this).find(':input').each(function () {
            switch (this.type) {
            case 'password':
            case 'select-multiple':
            case 'select-one':
            case 'text':
            case 'textarea':
                $(this).val('');
            case 'checkbox':
            case 'radio':
                this.checked = false;
            }
        });
    };

    function setPageControlWidth(duration) {
        var nav_width, app_width, diff;

        duration = duration || 0;

        app_width = $("#page_navigation").width();

        nav_width = 0;
        $("#page_navigation > *").each(function () {
            nav_width += $(this).outerWidth(true);
        });
        
        diff = (app_width - nav_width);

        $("#page_navigation > .control > form > #time_entry_name").animate({width: ("+=" + diff)}, duration);
    }

    function openPageControl(duration, input) {
        pageControlOpen = true;

        if (input) {
            $("#page_navigation > .control > form > #time_entry_name").focus();
            $("#page_navigation > .control > form > #time_entry_name").val(function(i, value) {
                return value + input;
            });
        }

        $("#page_navigation > *").stop(true, false);
        $("#page_navigation > *").animate({ left: 0 }, duration);
        setPageControlWidth(duration);
    }

    function closePageControl(duration) {
        pageControlOpen = false;

        $("#page_navigation > .control > form").clear();
        $("#page_navigation > .control > form > #time_entry_name").blur();

        var to, from;

        to    = $("#page_navigation > .control > .cancel").offset();
        from  = $("#page_navigation > .control > .add").offset();

        $("#page_navigation > *").stop(true, false);
        $("#page_navigation > *").animate({ left: to.left - from.left }, duration);
    }

    setPageControlWidth();
    closePageControl(0);

    $("#page_navigation > .control > .add").click(function () {
        openPageControl(200);
    });

    $("#page_navigation > .control > .cancel").click(function () {
        closePageControl(200);
    });

    $(document).keyup(function (e) {
        e.preventDefault();

        // escape
        if (e.which == 27) {
            closePageControl(200);
        }

        // ctrl+n
        if (e.ctrlKey && e.altKey && !e.shiftKey && e.keyCode === 78) {
            openPageControl(200);
        }
    })

    $(document).keypress(function (e) {
        // anything w/o a ctrl or alt binding
        if(!e.ctrlKey && !e.altKey) {
            openPageControl(100, String.fromCharCode(event.keyCode));
        }

        if(e.which != 13) {
          e.preventDefault();
        }
    });
});
