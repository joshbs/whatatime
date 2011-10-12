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

    function setPageControlWidth() {
        var nav_width, app_width, diff;

        app_width = $("#page_navigation").width();

        nav_width = 0;
        $("#page_navigation > *").each(function () {
            nav_width += $(this).outerWidth(true);
        });
        
        diff = (app_width - nav_width);

        $("#page_navigation > .control > form > #time_entry_name").width("+=" + diff);
    }

    function openPageControl(duration, autofocus) {
        pageControlOpen = true;

        $("#page_navigation > *").stop(true, false);
        $("#page_navigation > *").animate({ left: 0 }, duration);
        if (autofocus === true) {
            $("#page_navigation > .control > form > #time_entry_name").focus();
        }
    }

    function closePageControl(duration) {
        pageControlOpen = false;

        var to, from;

        to    = $("#page_navigation > .control > .cancel").offset();
        from  = $("#page_navigation > .control > .add").offset();

        $("#page_navigation > *").stop(true, false);
        $("#page_navigation > *").animate({ left: to.left - from.left }, duration);
        $("#page_navigation > .control > form").clear();
        $("#page_navigation > .control > form > #time_entry_name").blur();
    }

    setPageControlWidth();
    closePageControl(0);

    $("#page_navigation > .control > .add").click(function () {
        openPageControl(200);
    });

    $("#page_navigation > .control > .cancel").click(function () {
        closePageControl(200);
    });

    $("#page_navigation > .control > form > #time_entry_name").keyup(function (e) {
        if (e.which === 27) {
            closePageControl(200);
        }
    });

    $(document).keyup(function (e) {
        if (e.ctrlKey && e.altKey && !e.shiftKey) {
            if (e.keyCode === 78) {
                if (pageControlOpen) {
                    closePageControl(200);
                } else {
                    openPageControl(200);
                }
            }
        }
    });
});
