var light_bulb = $('.light-bulb a'),
  project_title = $(".title-color-" + project_color);

light_bulb.on("hover", function() {
  project_title.toggleClass('hovered');
});

project_title.on("hover", function() {
  light_bulb.toggleClass('hovered');
});
