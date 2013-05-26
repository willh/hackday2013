var best = best || {};
best.charts = best.charts || {};

best.charts.linechart = best.charts.linechart || (function() {
  var linechart_d3js = function linechart(_node, opts) {
    this.opts = $.extend({}, best.charts.linechart.Widget.default_options, opts);
    this.node = _node;
  };

  $.extend(linechart_d3js, {
    chart_type: 'linechart',
    default_options : {
      title : '',
      jsonUrl : '',
      auto_resize : true
    }
  });

  $.extend(linechart_d3js.prototype, {
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

      var node_id = this.node.id;

      var margin = {top: 40, right: 10, bottom: 50, left: 50},
          width = w - margin.left - margin.right,
          height = h - margin.top - margin.bottom;

      var header = d3.select("#" + node_id).append("h2").text(this.opts.title)

      d3.json(that.opts.jsonUrl, function(error, data) {
      console.log('data: ', data);
        var parseDate = d3.time.format("%d-%m-%Y").parse;

        var x = d3.time.scale().range([0, width]);
        var y = d3.scale.linear().range([height, 0]);

        var xAxis = d3.svg.axis().scale(x)
            .orient("bottom").ticks(5);

        var yAxis = d3.svg.axis().scale(y)
            .orient("left").ticks(5);

        var valueline = d3.svg.line()
            .x(function(d) { return x(d.date_val); })
            .y(function(d) { return y(d.value); });

        var svg = d3.select("#" + node_id)
            .append("svg")
                .attr("width", w)
                .attr("height", h)
            .append("g")
                .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

        data.forEach(function(d) {
            d.date_val = parseDate(d.date);
        });

        // Scale the range of the data
        x.domain(d3.extent(data, function(d) { return d.date_val; }));
        y.domain([0, d3.max(data, function(d) { return d.value; })]);

        svg.append("path")      // Add the valueline path.
            .attr("d", valueline(data));

        svg.append("g")         // Add the X Axis
            .attr("class", "x axis")
            .attr("transform", "translate(0," + height + ")")
            .call(xAxis);

        svg.append("g")         // Add the Y Axis
            .attr("class", "y axis")
            .call(yAxis);
      });
    }
  });

  return {
    Widget : linechart_d3js
  };
})();