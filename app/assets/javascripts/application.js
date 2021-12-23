// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require rails-ujs
//= require popper
//= require bootstrap
//= require jquery
//= require moment
//= require fullcalendar
//= require activestorage
//= require turbolinks
//= require_tree .



 $(document).on('turbolinks:load', function () {
    function eventCalendar() {
        return $('#calendar').fullCalendar({});
    };
    function clearCalendar() {
        $('#calendar').html('');
    };
    $(document).on('turbolinks:load', function () {
      eventCalendar();
    });
    $(document).on('turbolinks:before-cache', clearCalendar);
    $('#calendar').fullCalendar({
      events: '/tasks.json',
      //カレンダー上部を年月で表示させる
      titleFormat: 'YYYY年 M月',
      //曜日を日本語表示
      dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
       header: {
        left: 'prev,next today myCustomButton',
        center: 'title',
        right: 'month,agendaDay,list',
        defaultView: 'listWeek',
       },
       //イベントの時間表示を２４時間に
        timeFormat: "HH:mm",
        // Drag & Drop & Resize
        editable: true,
        //イベントの色を変える
        eventColor: '#EBAFA2',
        //イベントの文字色を変える
        eventTextColor: '#475263',
        eventRender: function(event, element) {
        element.css("font-size", "0.8em");
        element.css("padding", "5px");
        element.find('span.fc-title').html(element.find('span.fc-title').text());
        },
    });
 });
 
 