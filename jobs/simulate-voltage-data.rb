# Populate the graph with some random points
points = []
current = 30
last = current
(1..30).each do |i|
  points << { x: i, y: last + rand(2..8) -rand(1..6) }
end
last_x = points.last[:x]

current_12V_value = 12.218
last_12V_value = current_12V_value
  current_12V_value = last_12V_value + rand(100)/100-0.5

SCHEDULER.every '5s' do
  points.shift
  last_x += 1
  points << { x: last_x, y: last + rand(2..8) -rand(1..6) }

  send_event('ACVoltage', points: points)
   send_event('12VRail', { current: current_12V_value, last: last_12V_value })
end