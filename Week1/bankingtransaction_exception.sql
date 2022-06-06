DROP PROCEDURE IF EXISTS sp_deposit_transaction;
DELIMITER //

CREATE PROCEDURE sp_deposit_transaction (
	IN amount DECIMAL(12,0), 
	IN customer_id BIGINT,
    OUT message VARCHAR(150)
)
 BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
  SET autocommit = 0; 

    IF (SELECT COUNT(*) FROM customers WHERE  id = customer_id) > 0
    THEN 
		IF amount > 0
        THEN
			START TRANSACTION;
        
			SELECT balance
			FROM customers
			WHERE id = customer_id;
			
			SET message = "Failed to update balance";
			UPDATE customers AS c
			SET c.balance = c.balance + amount
			WHERE c.id = customer_id;
            
			SET message = "Failed to create deposit transaction";
			INSERT INTO deposits (
				created_at,
				transaction_amount,
				customer_id,
				updated_at
			)
			VALUE (
				CURRENT_TIMESTAMP, 
                amount, 
                customer_id, 
                CURRENT_TIMESTAMP
			);		
			COMMIT;
            
            SET message = "Successfully!";
		ELSE
			SET message = "Failed because amount is equal or less than 0.";
		END IF;
	ELSE 
		SET message = concat('Customer with ID ',customer_id,' Not Found!');
	END IF;
 END //

DELIMITER ;

DROP PROCEDURE IF EXISTS sp_withdraw_transaction;
DELIMITER //

CREATE PROCEDURE sp_withdraw_transaction (
	IN amount DECIMAL(12,0), 
	IN customer_id BIGINT,
    OUT message VARCHAR(150)
)
 BEGIN
	DECLARE credit DECIMAL(12,0);
	DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;  
    SET autocommit = 0; 
    IF (SELECT COUNT(*) FROM customers WHERE  id = customer_id) > 0
    THEN
		SELECT balance
        INTO credit
        FROM customers
        WHERE id = customer_id;
        
        IF (credit >= amount)
        THEN
			IF (amount >= 50)
			THEN
                START TRANSACTION;
            
				SET message = "Failed to update balance";
				UPDATE customers AS c
				SET c.balance = credit - amount
				WHERE c.id = customer_id;
				
				SET message = "Failed to create withdraw transaction";
                INSERT INTO withdraws (
					created_at,
                    transaction_amount,
                    customer_id,
                    updated_at
				)
				VALUE (
					CURRENT_TIMESTAMP, 
                    amount, 
                    customer_id,
                    CURRENT_TIMESTAMP
				);
				COMMIT;
                
				SET message = "Successfully!";            
			ELSE
				SET message = "Failed because transaction amount is less than 50.";
			END IF;
		ELSE
			SET message = "Failed because balance is not enough to withdraw.";
		END IF;
	ELSE 
		SET message = concat('Customer with ID ',customer_id,' Not Found!');
	END IF;
 END //

DELIMITER;

DROP PROCEDURE IF EXISTS sp_transfer_transaction;
DELIMITER //

CREATE PROCEDURE sp_transfer_transaction (
	IN transfer_amount DECIMAL(12,0), 
	IN customer_id_1 BIGINT,
	IN customer_id_2 BIGINT,
    OUT message VARCHAR(150)
)
 BEGIN
	DECLARE credit_1 DECIMAL(12,0);
	DECLARE credit_2 DECIMAL(12,0);
    DECLARE fees_amount DECIMAL(12,0);
    DECLARE amount DECIMAL(12,0);
	DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
	SET autocommit = 0; 
    IF (SELECT COUNT(*) FROM customers WHERE  id = customer_id_1) > 0
    THEN
        IF (SELECT COUNT(*) FROM customers WHERE  id = customer_id_2) > 0
		THEN
			IF customer_id_1 <> customer_id_2
			THEN            
                START TRANSACTION;

				SELECT balance
				INTO credit_1
				FROM customers
				WHERE id = customer_id_1;
                
                SELECT balance
				INTO credit_2
				FROM customers
				WHERE id = customer_id_2;
                
                IF (credit_1 >= transfer_amount)
				THEN
					IF (transfer_amount >= 50)
					THEN
						SELECT transfer_amount*10/100 INTO fees_amount;
						SELECT transfer_amount + fees_amount INTO amount;
                        
						IF (credit_1 >= amount)
                        THEN
                        	SET message = "Failed to update recipient balance";
							UPDATE customers AS c
							SET c.balance = credit_2 + transfer_amount
							WHERE c.id = customer_id_2;
                            
                            SET message = "Failed to update sender balance";
                            UPDATE customers AS c
							SET c.balance = credit_1 - amount
							WHERE c.id = customer_id_1;
                            
                            SET message = "Failed to create transfer transaction";
							INSERT INTO transfers (
								created_at,
								transaction_amount,
                                transfer_amount,
								sender_id,
                                recipient_id,
								updated_at,
                                fees,
                                fees_amount
							)
							VALUE (
								CURRENT_TIMESTAMP, 
                                amount, 
                                transfer_amount,
                                customer_id_1, 
                                customer_id_2,
                                CURRENT_TIMESTAMP,
                                10,
                                fees_amount
							);
							COMMIT;
                            
							SET message = "Successfully!";		
                        ELSE
							SET message = "Failed because balance is not enough to transfer with fee.";
						END IF;
					ELSE
						SET message = "Failed because transaction amount is less than 50.";
					END IF;
				ELSE
					SET message = "Failed because balance is not enough to transfer.";
				END IF;
			ELSE 
				SET message = 'Failed because both account are the same.';
			END IF;	
		ELSE 
			SET message = concat('Customer with ID ', customer_id_2,' Not Found!');
		END IF;	
	ELSE 
		SET message = concat('Customer with ID ', customer_id_1,' Not Found!');
	END IF;
 END //

DELIMITER ;

DROP PROCEDURE IF EXISTS sp_transfer_transaction;
DELIMITER //


-- Lỗi vượt quá kiểu dữ liệu khai báo
-- Dùng Decimal/BigDecimal để tránh lỗi khi tính toán về tiền tệ thay vì dùng float, double
