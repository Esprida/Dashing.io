current_chargelevel = 100

SCHEDULER.every '15s' do
	last_chargelevel = current_chargelevel
	current_chargelevel = last_chargelevel - rand(1..2)
	if current_chargelevel < 5
		current_chargelevel = 100
	end	
	send_event('chargelevel', {current: current_chargelevel})
end	