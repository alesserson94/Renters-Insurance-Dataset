-- Clean Applications Table
-- Rename columns and group tenants by eviction history
select
right(application_id,7) as app_id,
right(property_id,5) as property_id,
application_date as app_date,
employment_type as employment_status,
annual_income as income,credit_score,
case
when num_prior_evictions !=0
then 'Yes'
else 'No'
end as previously_evicted,
has_cosigner,application_status as approval_status,
annual_policy_fee as premium,
round(monthly_rent_at_application,0) as monthly_rent,
num_occupants as tenants,notes
from applications
order by app_id;


-- Clean Properties Table
-- Rename columns and change formatting of lease length & state columns
select
right(property_id,5) as property_id,
property_city as city,
upper(property_state) as state,
property_zip as zip,
unit_type,
monthly_rent,landlord_type,
concat(lease_term_months, ' months') as lease_length
from properties;

