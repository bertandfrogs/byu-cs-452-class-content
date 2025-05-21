select id, CASE
    WHEN p_id is null THEN 'Root'
    WHEN id in (
        select distinct p_id from Tree 
        where p_id is not null
    ) THEN 'Inner'
    ELSE 'Leaf'
    END 
as type
from Tree;