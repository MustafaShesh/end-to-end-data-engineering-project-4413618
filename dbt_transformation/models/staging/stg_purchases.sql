select
    id,
    user_id,
    returned_at as purchase_status,
    purchased_at,
    added_to_cart_at,
from {{ source("RAW_DATA", "PURCHASES") }}