WITH dex_trans AS (
    SELECT 
        date_trunc('hour', block_time) AS block_hour,
        taker AS owner,
        CASE
            WHEN token_bought_address = 0x15e6e0d4ebeac120f9a97e71faa6a0235b85ed12 THEN amount_usd
            ELSE -amount_usd
        END AS amount
    FROM
        dex.trades
    WHERE
        (token_bought_address = 0x15e6e0d4ebeac120f9a97e71faa6a0235b85ed12 OR token_sold_address = 0x15e6e0d4ebeac120f9a97e71faa6a0235b85ed12)
)

, hour_owner_trans AS (
    SELECT
        block_hour,
        owner,
        SUM(amount) AS amount
    FROM
        dex_trans
    GROUP BY
        block_hour, owner
)

, buy_sell_user_volume AS (
    SELECT
        block_hour,
        SUM(CASE WHEN amount > 0 THEN amount ELSE 0 END) AS buy_volume,
        SUM(CASE WHEN amount < 0 THEN amount ELSE 0 END) AS sell_volume
    FROM
        hour_owner_trans
    GROUP BY
        block_hour
)

SELECT * FROM buy_sell_user_volume
