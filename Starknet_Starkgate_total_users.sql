SELECT
  COUNT(DISTINCT "from") AS users
FROM
  ethereum."transactions"
WHERE
  "to" = 0xae0Ee0A63A2cE6BaeEFFE56e7714FB4EFE48D419  -- StarkNet: StarkGate ETH Bridge
  AND value > 0
  AND success
