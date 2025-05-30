/*

=====================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
======================================================
Script Purpose:
  This stored procedure loads data into the "bronze" schema from external CSV files.
  It performs the following actions:
    - Truncates the tables before loading the data
    - Uses COPY to load data from csv files into the bronze tables

Parameter:
  No paramaters needed to run this stored procedure.

usage:
  CALL bronze.load_bronze();

*/

CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql AS $$
DECLARE
	start_time TIMESTAMP;
	end_time TIMESTAMP;
	duration INTERVAL;
	batch_start_time TIMESTAMP;
	batch_end_time TIMESTAMP;
BEGIN
	RAISE NOTICE '======================================';
	RAISE NOTICE 'Loading Bronze Layer';
	RAISE NOTICE '======================================';

	RAISE NOTICE '--------------------------------------';
	RAISE NOTICE 'Loading CRM Tables';
	RAISE NOTICE '--------------------------------------';

	batch_start_time := CURRENT_TIMESTAMP;
	start_time := CURRENT_TIMESTAMP;
	RAISE NOTICE '>> Truncationg Table: bronze.crm_cust_info';
	EXECUTE 'TRUNCATE TABLE bronze.crm_cust_info';
	RAISE NOTICE '>> Inserting Data Into: bronze.crm_cust_info';
	EXECUTE 'COPY bronze.crm_cust_info FROM ''/Library/PostgreSQL/17/datasets/source_crm/cust_info.csv''
	WITH (
		FORMAT csv,
		HEADER true,
		DELIMITER '',''
	)';
	end_time := CURRENT_TIMESTAMP;
	duration := end_time - start_time;
	RAISE NOTICE '>> Load Duration: %', duration;
	RAISE NOTICE '--------------------------------------';

	start_time := CURRENT_TIMESTAMP;
	RAISE NOTICE '>> Truncationg Table: bronze.crm_prd_info';
	EXECUTE 'TRUNCATE TABLE bronze.crm_prd_info';
	RAISE NOTICE '>> Inserting Data Into: bronze.crm_prd_info';
	EXECUTE 'COPY bronze.crm_prd_info FROM ''/Library/PostgreSQL/17/datasets/source_crm/prd_info.csv''
	WITH (
		FORMAT csv,
		HEADER true,
		DELIMITER '',''
	)';
	end_time := CURRENT_TIMESTAMP;
	duration := end_time - start_time;
	RAISE NOTICE '>> Load Duration: %', duration;
	RAISE NOTICE '--------------------------------------';

	start_time := CURRENT_TIMESTAMP;
	RAISE NOTICE '>> Truncationg Table: bronze.crm_sales_details';
	EXECUTE 'TRUNCATE TABLE bronze.crm_sales_details';
	RAISE NOTICE '>> Inserting Data Into: bronze.crm_sales_details';
	EXECUTE 'COPY bronze.crm_sales_details FROM ''/Library/PostgreSQL/17/datasets/source_crm/sales_details.csv''
	WITH (
		FORMAT csv,
		HEADER true,
		DELIMITER '',''
	)';
	end_time := CURRENT_TIMESTAMP;
	duration := end_time - start_time;
	RAISE NOTICE '>> Load Duration: %', duration;
	RAISE NOTICE '--------------------------------------';

	RAISE NOTICE '--------------------------------------';
	RAISE NOTICE 'Loading ERP Tables';
	RAISE NOTICE '--------------------------------------';

	start_time := CURRENT_TIMESTAMP;
	RAISE NOTICE '>> Truncationg Table: bronze.erp_cust_az12';
	EXECUTE 'TRUNCATE TABLE bronze.erp_cust_az12';
	RAISE NOTICE '>> Inserting Data Into: bronze.erp_cust_az12';
	EXECUTE 'COPY bronze.erp_cust_az12 FROM ''/Library/PostgreSQL/17/datasets/source_erp/CUST_AZ12.csv''
	WITH (
		FORMAT csv,
		HEADER true,
		DELIMITER '',''
	)';
	end_time := CURRENT_TIMESTAMP;
	duration := end_time - start_time;
	RAISE NOTICE '>> Load Duration: %', duration;
	RAISE NOTICE '--------------------------------------';

	start_time := CURRENT_TIMESTAMP;
	RAISE NOTICE '>> Truncationg Table: bronze.erp_loc_a101';
	EXECUTE 'TRUNCATE TABLE bronze.erp_loc_a101';
	RAISE NOTICE '>> Inserting Data Into: bronze.erp_loc_a101';
	EXECUTE 'COPY bronze.erp_loc_a101 FROM ''/Library/PostgreSQL/17/datasets/source_erp/LOC_A101.csv''
	WITH (
		FORMAT csv,
		HEADER true,
		DELIMITER '',''
	)';
	end_time := CURRENT_TIMESTAMP;
	duration := end_time - start_time;
	RAISE NOTICE '>> Load Duration: %', duration;
	RAISE NOTICE '--------------------------------------';

	start_time := CURRENT_TIMESTAMP;
	RAISE NOTICE '>> Truncationg Table: bronze.erp_px_cat_g1v2';
	EXECUTE 'TRUNCATE TABLE bronze.erp_px_cat_g1v2';
	RAISE NOTICE '>> Inserting Data Into: bronze.erp_px_cat_g1v2';
	EXECUTE 'COPY bronze.erp_px_cat_g1v2 FROM ''/Library/PostgreSQL/17/datasets/source_erp/PX_CAT_G1V2.csv''
	WITH (
		FORMAT csv,
		HEADER true,
		DELIMITER '',''
	)';
	end_time := CURRENT_TIMESTAMP;
	duration := end_time - start_time;
	RAISE NOTICE '>> Load Duration: %', duration;
	RAISE NOTICE '--------------------------------------';
	batch_end_time := CURRENT_TIMESTAMP;
	duration := end_time - start_time;
	RAISE NOTICE '============================================';
	RAISE NOTICE 'Loading Bronze Layer is Completed';
	RAISE NOTICE 'Total Duration: %', duration;
	RAISE NOTICE '============================================';

EXCEPTION
	WHEN OTHERS THEN
        RAISE NOTICE '============================================';
        RAISE NOTICE 'ERROR OCCURRED DURING LOADING OF BRONZE LAYER';
        RAISE NOTICE 'Error Message: %', SQLERRM;
        RAISE NOTICE 'Error Code: %', SQLSTATE;
        RAISE NOTICE '============================================';

		----Propagate
		RAISE;	
END;
$$;

CALL bronze.load_bronze();
