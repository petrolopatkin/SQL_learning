-- Error Handling + Transaction
-- Task 1
CREATE PROCEDURE ErrorHandlingWithTransaction @id INT AS 
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
        UPDATE purchases 
        SET purchase_price = purchase_price/0
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

EXECUTE  ErrorHandlingWithTransaction 5;

-- Throw Method in Stored Procedures
-- Task 1
CREATE PROCEDURE CheckPurchaseAndThrow @id INT AS 
BEGIN
	BEGIN TRY 
		SELECT 
        item, category, purchase_price, quantity, date
        FROM purchases 
        WHERE id = @;
        
        IF id EXISTS()
			SELECT 1
			FROM purchases 
			WHERE id = @id
        ELSE 
			THROW 54000, 'Divide By Zero Error', 1
        
        SELECT 10/0;
    END TRY
    BEGIN CATCH
		SELECT 
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_MESSAGE() AS ErrorMessage,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_STATE() AS ErrorState,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_LINE() AS ErrorLine
    END CATCH
END

EXECUTE CheckPurchaseAndThrow 5;