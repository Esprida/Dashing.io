buzzwords = ['EC-2143 (Front Panel)', 'EC-2147 (Side Entrance)', 'EC-2142 (Inventory Room)', 'EC-2148 (Rear Entrance)', 'EC-2149 (Lobby)', 'EC-2150 (Loading Dock 1)', 'EC-2151 (Loading Dock 2)',] 
buzzword_counts = Hash.new({ value: 0 })

SCHEDULER.every '2m' do
  random_buzzword = buzzwords.sample
  buzzword_counts[random_buzzword] = { label: random_buzzword, value: (buzzword_counts[random_buzzword][:value] + 1) % 30 }
  
  send_event('buzzwords', { items: buzzword_counts.values })
end