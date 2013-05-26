$( document ).ready(function() {
  console.log("ready!");

  $(".hide_show").each(function(index, node) {
    $(node).click(function() {
      var group = $(this).attr('data-hide-show-group'),
          show_id = $(this).attr('data-hide-show-id');
      $("." + group).addClass("hide")
      $("#" + show_id).removeClass("hide")
    });
  });

  $(".treemap").each(function(index, node) {
    new best.charts.treemap.Widget(node, {
      title: 'Incidents by location',
      jsonUrl: $(node).attr('data-url')
    }).draw(940, 400);
  });



});