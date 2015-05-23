function onPageLoad(metrics) {

  var data = new google.visualization.DataTable();
  data.addColumn('number', 'Flog');
  data.addColumn('number', 'Churn');
  data.addColumn({type:'string', role:'tooltip'});

  var options = {
    title: 'Flog & Churn',
    hAxis: {title: 'Flog', minValue: 0, maxValue: 10},
    vAxis: {title: 'Churn', minValue: 0, maxValue: 10},
    legend: 'none'
  };

  var chart = new google.visualization.ScatterChart(document.getElementById('chart_div'));

  rows = metricsToDataRows(metrics)
  data.addRows(rows)

  chart.draw(data, options);

}

function metricsToDataRows(metrics) {
  return metrics.map(function(metric) {
    return [ metric.times_changed, metric.flog, tooltip(metric) ]
  });
}

function tooltip(metric) {
  return metric.file +
    "\nTimes Changed: " +
    metric.times_changed +
    "\nFlog: " +
    metric.flog
}
