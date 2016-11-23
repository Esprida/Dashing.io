current_batterystatus = 100

SCHEDULER.every '15s' do
	last_batterystatus = current_batterystatus
	current_batterystatus = last_batterystatus-rand(1..2);
	if current_batterystatus < 5 
		current_batterystatus = 100
	end	
	send_event('batterystatus', {current: current_batterystatus})
end	