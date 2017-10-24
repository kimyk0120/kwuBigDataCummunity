(function($) {

	$.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
        monthNamesShort: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '.',
        firstDay: 1
    });

    function adjustBtnFixed() {
        var w = $(window),
            cont = $('.snz-page-content'),
            btn = $('.snz-add-btn');
            
        var xx = cont.offset().left - cont.offsetParent().scrollLeft() + cont.outerWidth() - btn.width();
        var yy = cont.offset().top - cont.offsetParent().scrollTop() + cont.outerHeight() - btn.height();
        var maxX = w.width() - btn.width();
        var maxY = w.height() - btn.height();

        if(xx > maxX) xx = maxX;
        if(yy > maxY - 40) yy = maxY - 40;

        btn.css({
            left: xx + 'px',
            top: yy + 'px',
            rigth: 'auto',
            bottom: 'auto',
        });
    }
    

	$(function() {
        $('#datepicker1').datepicker();
        $('#datepicker2').datepicker();

        if ( !$('.navbar-default .navbar-toggle').hasClass('collapsed') ) {
            $('.navbar-default .navbar-toggle').html('<span><img src="/assets/img/common/x-copy.png" alt=""></span>');
        }

        if ( $(window).width() < 768 ) {
            $('table.table.lec-table').attr('width', '320');
        }

        $('.detail-rank span.rank-image').click(function() {
            $(this).toggleClass('active');
        });
        $('.item-number span.rank-image').click(function() {
            $(this).toggleClass('active');
        });

        $('.navbar-toggle').on( 'click', function() {
            $('.snz-modal-layer').toggleClass('show', $(this).hasClass('collapsed'));
        } );

        $('.nav-collapse-mo').click( function() {
            $('.nav-collapse-mo-inner').toggleClass('extended');
        });

        $('.nav-search-mo').click( function() {
            $('.nav-search-mo-inner').toggleClass('extended');
        });

        if( $('.snz-detail-title h1').height() > 30 ) {
            $('.snz-detail-title').css('height', '40px');
        }

        adjustBtnFixed();

    });

})(jQuery);