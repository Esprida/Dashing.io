source = 'http://some.remote.host/barchart.xml'

labels = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul','Aug','Sep','Oct','Nov','Dec']

SCHEDULER.every '10s', :first_in => 0 do |job|

  send_event('barchart', {
    labels: labels,
    datasets: [
      {
        label: 'Humidity Bar (Average)',
        fillColor: 'rgba(220,220,220,0.5)',
        strokeColor: 'rgba(220,220,220,0.8)',
        highlightFill: 'rgba(220,220,220,0.75)',
        highlightStroke: 'rgba(220,220,220,1)',
        data: Array.new(labels.length) { rand(20..65) }
      }
    ]
  })
end