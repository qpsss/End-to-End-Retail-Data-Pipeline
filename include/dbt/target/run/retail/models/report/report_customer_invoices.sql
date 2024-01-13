
  
    

    create or replace table `passamons-retail-data-pipeline`.`retail`.`report_customer_invoices`
    
    

    OPTIONS()
    as (
      SELECT
  c.country,
  c.iso,
  COUNT(fi.invoice_id) AS total_invoices,
  SUM(fi.total) AS total_revenue
FROM `passamons-retail-data-pipeline`.`retail`.`fct_invoices` fi
JOIN `passamons-retail-data-pipeline`.`retail`.`dim_customer` c ON fi.customer_id = c.customer_id
GROUP BY c.country, c.iso
ORDER BY total_revenue DESC
LIMIT 10
    );
  