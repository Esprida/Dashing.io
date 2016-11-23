current_humidity = 30

SCHEDULER.every '30s' do
  last_humidity = current_humidity
  current_humidity = last_humidity + rand(2..8) - rand(1..5)
  
  if current_humidity > 70 
	current_humidity = 25
	end	

  send_event('humidity', { current: current_humidity, last: last_humidity })
end