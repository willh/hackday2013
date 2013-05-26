$( document ).ready(function() {
  console.log("ready!");

  var chart = document.getElementById('treemap');
  new best.charts.treemap.Widget(chart, {
    title: 'Incidents by location',
    jsonUrl: $(chart).attr('data-url')
  }).draw(940, 400);
});