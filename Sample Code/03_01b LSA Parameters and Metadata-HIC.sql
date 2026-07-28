/*
LSA FY2025 Sample Code
Name:	03_01b LSA Parameters and Metadata - HIC.sql 
https://github.com/HMIS/LSASampleCode

Author:  Molly McEvilley
Last Update: 7/27/2026

Source: LSA Programming Specifications v8  
Relevant Sections:
		https://github.com/HMIS/LSASampleCode/blob/master/LSA%20Documentation/03%20-%20Core%20Concepts%20and%20Data%20Universe.md#31-report-parameters-and-metadata-lsa_report
	
	The hard-coded values here must be replaced with code to accept actual user-entered parameters 
	and info specific to the HMIS application.
*/

delete from lsa_Report 

insert into lsa_Report (
		  ReportID			--system-generated unique identifier for report process
		, ReportStart		--user-entered start of report period
		, ReportEnd			--user-entered end of report period 
		, ReportCoC			--user-selected HUD Continuum of Care Code
		, SoftwareVendor	--name of vendor  
		, SoftwareName		--name of HMIS application
		, VendorContact		--name of vendor contact
		, VendorEmail		--email address of vendor contact
		, LSAScope			--user-selected 1=systemwide, 2=project-focused 3=HIC
		, LookbackDate		--ReportStart - 7 years
		)
	select
		  right(year(getdate()), 1)*100000000 + cast(format (getdate(),'MMddHHmm') as int)
		, '1/28/2027'
		, '1/28/2027'
		, 'XX-501'
		, 'Sample Code Inc.'
		, 'LSA Online'
		, 'Molly'			
		, 'molly@squarepegdata.com'
		, 3					
		, dateadd(yyyy, -7, '1/28/2027')
