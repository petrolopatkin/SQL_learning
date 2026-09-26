-- Practice 
-- Task 1 Stored Procedure
CREATE PROCEDURE GetPurchaseById @id INT AS 
BEGIN
	SELECT 
    id, purchase_price
    FROM purchases 
    WHERE id = @id
END;

EXECUTE GetPurchaseById 5;

-- Task 2 Update the Stored Procedure
CREATE PROCEDURE UpdatePurchasePrice @id INT, @new_price DECIMAL(10, 2) AS
BEGIN
	UPDATE purchases 
    SET purchase_price = @new_price
    WHERE id = @id
    
	OUTPUT
		deleted.purchase_price,
        inserted.purchase_price
END;

EXECUTE UpdatePurchasePrice 5, 120;

-- Task 3 Transaction + Stored Procedure 
CREATE PROCEDURE ChangePurchasePrice @id INT, @new_price DECIMAL(10, 2) AS
BEGIN
	BEGIN TRANSACTION
		UPDATE purchases 
        SET purchase_price = @new_price
        WHERE id = @id
        
        IF @@ROWCOUNT = 1
			COMMIT
		ELSE 
			ROLLBACK
	END TRANSACTION
END;

EXECUTE ChangePurchasePrice 5, 120;

-- Task 4 Try Catch + Transaction inside Stored Procedure
CREATE PROCEDURE ErrorHandlingPurchase @id INT AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE purchases 
			SET purchase_price = purchase_price / 0
            WHERE id = @id
		COMMIT
	END TRY
    BEGIN CATCH
				ROLLBACK
				SELECT
					ERROR_NUMBER() AS ErrorNumber,
					ERROR_MESSAGE() AS ErrorMessage,
					ERROR_PROCEDURE() AS ErrorProcedure,
					ERROR_STATE() AS ErrorState,
					ERROR_SEVERITY() AS ErrorSeverity,
					ERROR_LINE() AS ErrorLine
    END CATCH
END;

EXECUTE ErrorHandlingPurchase 5;

-- Task 5 Combined
CREATE PROCEDURE ChangePurchasePriceSafe @id INT, @new_price DECIMAL(10, 2) AS 
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION 
			UPDATE purchases
            SET purchase_price = @new_price
            WHERE id = @id 
            
            OUTPUT 
				deleted.id,
				deleted.purchase_price,
				inserted.purchase_price 
                
			IF @@ROWCOUNT = 1
				COMMIT
			ELSE 
				ROLLBACK
    END TRY
    BEGIN CATCH
		ROLLBACK
		SELECT 
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_MESSAGE() AS ErrorMessage,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_STATE() AS ErrorState,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_LINE() AS ErrorLine
    END CATCH
END;

EXECUTE ChangePurchasePriceSafe 5, 120;