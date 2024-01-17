select
  date_trunc('day', block_time) as day,
  count(distinct "from") as daily_users --to update at Daily Users for the graph
from
  ethereum."transactions"
where
  "to" = 0x95fC37A27a2f68e3A647CDc081F0A89bb47c3012 -- Mantle: L1 Standard Bridge Proxy
  and value > 0
  and success
group by
  1
order by
  1 desc
