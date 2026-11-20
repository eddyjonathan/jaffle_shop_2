select  
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_mehod,
        status,
        amount,
        created

from raw.stripe.payment