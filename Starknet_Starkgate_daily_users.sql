select
  date_trunc('day', block_time) as day,
  count(distinct "from") AS daily_users
from
  ethereum."transactions"
where
  "to" = 0xae0ee0a63a2ce6baeeffe56e7714fb4efe48d419 -- StarkNet: StarkGate ETH Bridge
  and success = true
  and value > 0
group by
  1
order by
  1 desc
