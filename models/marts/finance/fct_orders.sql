select  o.order_id,
        o.customer_id,
        round( sum(amount/100.0), 2) as amount

from {{ ref('stg_jaffle_shop__orders') }} o
inner join {{ ref('stg_stripe__payments') }} p using (order_id)
where p.status='success' and p.amount>0
group by o.order_id, o.customer_id
order by o.order_id