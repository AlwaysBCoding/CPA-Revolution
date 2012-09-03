// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require_tree .

$(function() {
	$(".flashNotice").delay(1500).animate({opacity: 0}, 1000);
});

function seconds2time(seconds) {
    var hours   = Math.floor(seconds / 3600);
    var minutes = Math.floor((seconds - (hours * 3600)) / 60);
    var seconds = seconds - (hours * 3600) - (minutes * 60);
    var time = "";

    if (hours != 0) {
      time = hours+":";
    } else if (hours == 0) {
      time = "0:";
    }
    if (minutes != 0 || time !== "") {
      minutes = (minutes < 10 && time !== "") ? "0"+minutes : String(minutes);
      time += minutes+":";
    }
    if (time === "") {
      time = seconds+"s";
    }
    else {
      time += (seconds < 10) ? "0"+seconds : String(seconds);
    }
    return time;
}

function time2seconds(time) {
  var hours = parseInt(time.match(/\d:/)) ? parseInt(time.match(/\d:/)[0].replace(":", "")) : 0;
  var minutes = parseInt(time.match(/:\d+:/)) ? parseInt(time.match(/:\d+:/)[0].replace(":", "").replace(":", "")) : 0;
  var seconds = parseInt(time.match(/\d+$/)) ? parseInt(time.match(/\d+$/)[0]) : 0;
  return (hours * 3600) + (minutes * 60) + (seconds);
}