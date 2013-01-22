function getMediaDescription(project_list, hashedId) {
  if (project_list.length) {
    for (var i=0; i < project_list.length; i++) {
      for (var j=0; j < project_list[i]["media"].length; j++) {
        var m = project_list[i]["media"][j];
        if (m["hashed_id"] == hashedId) {
          return [m["name"], m["short_description"]];
        }
      }
    }
  } else {
    for (var j=0; j < project_list["media"].length; j++) {
      var m = project_list["media"][j];
      if (m["hashed_id"] == hashedId) {
        return [m["name"], m["short_description"]];
      }
    }
  }
  return null;
}

function appendToDescription(description) {
  var description_box = $('.hover_description .description_text_box');
  if (description[0] != description_box.find('h1').text()) {
    description_box.html("").append("<h1>" + description[0] + "</h1><p>" + description[1] + "</p>");
  }
}

function positionDescription(thumbnail) {
  var offset = thumbnail.offset();
  $('.hover_description').css({
    "top": offset.top + thumbnail.outerHeight(),
    "left": offset.left - thumbnail.width()/2
  });
}

$(document).ready( function() {
  $('body').append('<div class="hover_description"><div class="tooth"></div><div class="description_text_box"></div></div>');
});
