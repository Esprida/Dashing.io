# Populate the graph with some random points
points = []
current = 20
last = current
current = last + rand(3..5) - rand(1..4)
(1..30).each do |i|
  points << { x: i, y: current  }
end
last_x = points.last[:x]

SCHEDULER.every '5s' do
  points.shift
  last_x += 1
  points << { x: last_x, y: current + rand(2..4) - rand(1..3) }

  send_event('convergence', points: points)
end