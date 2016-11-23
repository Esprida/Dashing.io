current_karma = 5

SCHEDULER.every '5s' do
  last_karma     = current_karma
  current_karma     = (current_karma < 0 ? 0 : rand(3)-1)

  send_event('helpdesktickets', { current: current_karma, last: last_karma })
end