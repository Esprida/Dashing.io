current_hdspeed = 500
current_hdtemp = 60

SCHEDULER.every '10m' do
	last_hdspeed = current_hdspeed
	last_hdtemp = current_hdtemp
	current_hdspeed = last_hdspeed + rand(50..100) - rand(20..80)
	current_hdtemp = last_hdtemp + rand(5..10) - rand(2..6)
	
	send_event('hdspeed', {current: current_hdspeed})
	send_event('hdtemp', {current: current_hdtemp})
end	