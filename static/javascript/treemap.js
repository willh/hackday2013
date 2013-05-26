var best = best || {};
best.charts = best.charts || {};

best.charts.treemap = best.charts.treemap || (function() {
  var treemap_d3js = function treemap(_node, opts) {
    this.opts = $.extend({}, best.charts.treemap.Widget.default_options, opts);
    this.node = _node;
  };

  $.extend(treemap_d3js, {
    chart_type: 'treemap',
    default_options : {
      title : '',
      jsonUrl : '',
      auto_resize : true
    }
  });

  $.extend(treemap_d3js.prototype, {
    _init : function() {
      var that = this;

      if (this.opts.auto_resize) {
        $(window).on('resize', function() {
          that._onWindowResize();
        });
      }
    },

    _onWindowResize : function() {
      if ($(this.node).is(':visible') == false) {
        return;
      }

      var that = this, jnode = $(this.node);

      window.clearTimeout(this.timeout_id);
      this.timeout_id = setTimeout(function() {
        var width = jnode.innerWidth();
        if (that.width != width) {
          that.draw(width, that.height);
        }
      }, 50);
    },

    draw : function(w, h) {
      var that = this;
      console.log('draw treemap!');

      var margin = {top: 40, right: 10, bottom: 10, left: 10},
          width = w - margin.left - margin.right,
          height = h - margin.top - margin.bottom;

      var color = d3.scale.category20c();

      var treemap = d3.layout.treemap()
        .size([width, height])
        .sticky(true)
        .value(function(d) { return d.value; });

      d3.json(that.opts.jsonUrl, function(error, root) {

        var header = d3.select("#treemap").append("h2").text(root.name + ' - ' + root.value)

        var div = d3.select("#treemap").append("div")
          .style("position", "relative")
          .style("width", (width + margin.left + margin.right) + "px")
          .style("height", (height + margin.top + margin.bottom) + "px")
          .style("left", margin.left + "px")
          .style("top", margin.top + "px");

        var node = div.datum(root).selectAll(".node")
          .data(treemap.nodes)
          .enter().append("div")
          .attr("class", "node")
          .call(function() {
            this.style("left", function(d) { return d.x + "px"; })
                .style("top", function(d) { return d.y + "px"; })
                .style("width", function(d) { return Math.max(0, d.dx - 1) + "px"; })
                .style("height", function(d) { return Math.max(0, d.dy - 1) + "px"; })
                .style("cursor", function(d) { return d.url ? "pointer" : ""; });
          })
          .on("click", function(d) {
            if (d.url) {
              window.location = d.url;
            }
          })
          .style("background", function(d) { return d.children ? null : d3.rgb(color(d.name)).darker(); })
          .append('span').html(function(d) { return d.children ? null : d.name + ' - <em>' + d.value + '</em>'; });

        console.log('data!', root);
      });
    }
  });

  return {
    Widget : treemap_d3js
  };
})();