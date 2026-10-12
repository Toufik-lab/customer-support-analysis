
SELECT
    COUNT(*) AS total_tickets,

    COUNT(*) FILTER (
        WHERE ticket_id IS NULL
    ) AS missing_ticket_ids,

    COUNT(*) FILTER (
        WHERE team IS NULL
    ) AS missing_teams,

    COUNT(*) FILTER (
        WHERE agent IS NULL
    ) AS missing_agents,

    COUNT(*) FILTER (
        WHERE priority IS NULL
    ) AS missing_priorities,

    COUNT(*) FILTER (
        WHERE status IS NULL
    ) AS missing_statuses

FROM public.customer_support_tickets;
