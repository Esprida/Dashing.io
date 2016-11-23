current_valuation = 0
current_karma = 0
current_cpu_temp = 50
current_cpu_fan = 4000

SCHEDULER.every '5m' do
  last_valuation = current_valuation
  last_karma     = current_karma
  current_valuation = rand(100)+40
  current_karma     = rand(100)
  
  last_cpu_temp = current_cpu_temp
  current_cpu_temp = current_cpu_temp + rand(5..10) - rand(2..7)

   last_cpu_fan = current_cpu_fan
  current_cpu_fan = current_cpu_fan + rand(50..200)- rand(20..30)

  send_event('cpu-temp', { current: current_cpu_temp, last: last_cpu_temp })
  send_event('cpu-fan', { current: current_cpu_fan, last: last_cpu_fan })
end