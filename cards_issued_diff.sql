SELECT card_name, Max(issued_amount) - MIn(issued_amount) as difference FROM monthly_cards_issued
GROUP BY card_name
ORDER BY difference desc