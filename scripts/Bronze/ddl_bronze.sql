/*
===========================================
DDL SCRIPT: Create Bronze Layer
===========================================
Script Purpose:
  This script create table for bronze schema, it drops table if the same table already exists
  run this script to re-define the DDL structure of "bronze" tables. 
  FULL LOAD concept
*/

DROP TABLE IF EXISTS bronze.crm_cust_info;
CREATE TABLE bronze.crm_cust_info (
	cst_id INT,
	cst_key VARCHAR(50),
	cst_firstname VARCHAR(50),
	cst_lastname VARCHAR(50),
	cst_material_status VARCHAR(50),
	cst_gndr VARCHAR(50),
	cst_create_date DATE
);

DROP TABLE IF EXISTS bronze.crm_prd_info;
CREATE TABLE bronze.crm_prd_info (
	prd_id INT,
	prd_key VARCHAR(50),
	prd_nm VARCHAR(50),
	prd_cost INT,
	prd_line VARCHAR(50),
	prd_start_dt TIMESTAMP,
	prd_end_dt TIMESTAMP
);

DROP TABLE IF EXISTS bronze.crm_sales_details;
CREATE TABLE bronze.crm_sales_details (
	sls_ord_num VARCHAR(50),
	sls_prd_key VARCHAR(50),
	sls_cust_id INT,
	sls_order_dt INT,
	sls_ship_dt INT,
	sls_due_dt INT,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT
);

DROP TABLE IF EXISTS bronze.erp_loc_a101;
CREATE TABLE bronze.erp_loc_a101 (
	cid VARCHAR(50),
	cntry VARCHAR(50)
);

DROP TABLE IF EXISTS bronze.erp_cust_az12;
CREATE TABLE bronze.erp_cust_az12 (
	cid VARCHAR(50),
	bdate DATE,
	gen VARCHAR(50)
);

DROP TABLE IF EXISTS bronze.erp_px_cat_g1v2;
CREATE TABLE bronze.erp_px_cat_g1v2 (
	id VARCHAR(50),
	cat VARCHAR(50),
	subcat VARCHAR(50),
	maintenance VARCHAR(50)
);

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
