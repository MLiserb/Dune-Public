select
  date_trunc('day', block_time) as day,
  count(distinct "from") AS daily_users
from
  ethereum."transactions"
where
  "to" = 0x4Dbd4fc535Ac27206064B68FfCf827b0A60BAB3f -- Arbitrum Official Bridge Contract // Arbitrum: Delayed Inbox
  and success = true
  and value > 0
group by
  1
order by
  1 desc
