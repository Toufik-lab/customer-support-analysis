
SELECT
    agent,
    COUNT(*) AS total_tickets,

    COUNT(*) FILTER (
        WHERE status = 'Resolved'
    ) AS resolved_tickets,

    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE status = 'Resolved'
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS resolution_rate_pct,

    ROUND(
        AVG(customer_satisfaction), 2
    ) AS avg_satisfaction,

    ROUND(
        AVG(resolution_hours), 2
    ) AS avg_resolution_hours,

    COUNT(*) FILTER (
        WHERE sla_met = 'No'
    ) AS sla_missed_tickets

FROM public.customer_support_tickets
GROUP BY agent
ORDER BY avg_satisfaction DESC NULLS LAST;
