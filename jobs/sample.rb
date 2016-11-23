current_valuation = 0
current_karma = 5

SCHEDULER.every '5s' do
  last_valuation = current_valuation
  last_karma     = current_karma
  current_valuation = rand(100)
  current_karma     = rand(2)-1

  send_event('valuation', { current: current_valuation, last: last_valuation })
  send_event('helpdesktickets', { current: current_karma, last: last_karma })
  send_event('synergy',   { value: rand(100) })
end