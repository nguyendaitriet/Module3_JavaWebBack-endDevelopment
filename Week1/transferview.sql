DROP VIEW IF EXISTS vw_transfer_view;
CREATE VIEW vw_transfer_view AS

SELECT 
	T.id AS `Transfer ID`,
	T.sender_id AS `Sender ID`, 
    C.full_name AS `Sender Name` , 
    T.recipient_id, 
    N.`Recipient Name`, 
    T.transfer_amount AS `Transfer Amount`, 
    T.created_at AS `Transfer Date`,
    T.fees_amount AS `Fee Amount`
FROM  transfers AS T
INNER JOIN customers AS C   
ON T.sender_id = C.id
INNER JOIN (
	SELECT 
		T.id,
		T.recipient_id, 
        C.full_name AS `Recipient Name`
	FROM  transfers AS T
	INNER JOIN customers AS C   
	ON T.recipient_id = C.id
) AS N
ON N.id = T.id
ORDER BY T.id;

SELECT * FROM vw_transfer_view;

