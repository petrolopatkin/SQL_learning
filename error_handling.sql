-- Error Handling
-- Task 1
CREATE PROCEDURE TestErrorHandling @id INT, @new_price DECIMAL(10,2) AS
BEGIN
	BEGIN TRY
		SELECT 10/0
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
END;

EXECUTE TestErrorHandling;

-- Task 2
CREATE PROCEDURE CheckPurchase @id INT AS
BEGIN
	BEGIN TRY
			SELECT 
            item, category, purchase_price, quantity, date
            FROM purchases
            WHERE id = @id
            
            IF id 
            SELECT 1
            FROM purchases
            WHERE id = @id
            ELSE 
            print 'Purchase not found'
            
            SELECT 10/0
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
END;