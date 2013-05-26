$( document ).ready(function() {
  console.log("ready!");

  $(".treemap").each(function(index, node) {
    new best.charts.treemap.Widget(node, {
      title: 'Incidents by location',
      jsonUrl: $(node).attr('data-url')
    }).draw(940, 400);
  });

});