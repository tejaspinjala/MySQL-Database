# Query1: Return the ID and Name of interviewers who participate in interviews 
# where the interviewee’s name is “Hellen Cole” arranged for job “11111”.
SELECT		e.Employee_ID, p.Fname, p.Lname
	FROM	INTERVIEW_DETAILS id,
			EMPLOYEE e,
            PERSON p,
            PERSON pe,
            JOB_POSITION jp
	WHERE	e.Employee_ID = id.Interviewer_ID
		AND	e.Employee_ID = p.Personal_ID
        AND	id.Candidate_ID = pe.Personal_ID
        AND	jp.Job_ID = id.JOB_ID
		AND pe.Fname = 'Hellen'
        AND pe.Lname = 'Cole'
        And jp.Job_ID = 11111;

# Query2: Return the ID of all jobs which are posted by department “Marketing” in January 2011.
SELECT		jp.Job_ID
	FROM	JOB_POSITION jp,
			DEPARTMENT d
	WHERE	jp.Department_ID = d.Department_ID
		AND	d.Department_Name = 'Marketing'
        AND	MONTH(jp.Job_pdate) = 1
        AND YEAR(jp.Job_pdate) = 2011;

# Query3: Return the ID and Name of the employees having no supervisees.
SELECT 		e.Employee_ID, p.fname, p.lname
	FROM 	EMPLOYEE e,
			PERSON p
	WHERE 	e.Employee_ID = p.Personal_ID
		AND	e.Super_ID is NULL;

# Query4: Return the Id and Location of the marketing sites which have no sale records during March, 2011.
SELECT 		ms.Site_ID, ms.site_Location
	FROM 	MARKETING_SITE ms
	WHERE 	ms.Site_ID NOT IN (
			SELECT 		s.Site_ID
			FROM 		SALE s
			WHERE 		MONTH(s.Sale_Time) = 3
				AND 	YEAR(s.Sale_Time) = 2011);

# Query5: Return the job’s id and description which does not hire a suitable person one month after it is posted.
SELECT 		jp.Job_ID, jp.Job_Desc
	FROM 	JOB_POSITION jp
	WHERE 	jp.Job_ID NOT IN (
			SELECT DISTINCT sc.Job_ID
				FROM selected_candidates sc)
		AND jp.Job_pdate < DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

# Query6: Return the ID and Name of the salesmen who have sold all product type whose price is above $200.
SELECT 		e.Employee_ID, p.fName, p.lname
	FROM	EMPLOYEE e,
			PERSON p,
            SALE s,
			PRODUCT pr
	WHERE	e.Employee_ID = p.Personal_ID
		AND	e.Employee_ID = s.Salesman_ID
        AND	s.Product_ID = pr.Product_ID
        AND	pr.List_Price > 200
	GROUP BY e.Employee_ID, p.fName;

# Query7: Return the department’s id and name which has no job post during 1/1/2011 and 2/1/2011.
SELECT 		d.Department_ID, d.Department_Name
	FROM 	DEPARTMENT d
	WHERE 	d.Department_ID NOT IN (
			SELECT 	jp.Department_ID
			FROM 	JOB_POSITION jp
			WHERE 	jp.Job_pdate BETWEEN '2011-01-01' AND '2011-02-01');

# Query8: Return the ID, Name, and Department ID of the existing employees who apply job “12345”.
SELECT		e.Employee_ID, p.Fname, p.Lname, d.Department_ID
	FROM	EMPLOYEE e,
			PERSON p,
            DEPARTMENT d,
            INTERVIEW_DETAILS id,
            JOB_POSITION jp
	WHERE	e.Employee_ID = p.Personal_ID
		AND	e.Department_ID = d.Department_ID
        AND	e.Employee_ID = id.Candidate_ID
        AND	id.Job_ID = jp.Job_ID
        AND jp.Job_ID = '12345';

# Query9: Return the best seller’s type in the company (sold the most items).
SELECT 		pr.Product_Type
	FROM 	SALE s,
			PRODUCT pr
	WHERE	s.Product_ID = pr.Product_ID
    GROUP BY pr.Product_Type
	ORDER BY SUM(s.Quantity_sold) DESC;

# Query10: Return the product type whose net profit is highest in the company (money earned minus the part cost).
SELECT 		pr.Product_Type, (pr.List_Price - SUM(vp.Price * pp.Quantity)) AS Profit
	FROM 	PRODUCT pr,
			PRODUCT_PART pp,
            VENDOR_PART vp
	WHERE	pr.Product_ID = pp.Product_ID
		AND	pp.Part_Type_ID = vp.Part_Type_ID
	GROUP BY pr.Product_ID, pr.Product_Type, pr.List_Price
	ORDER BY Profit DESC;

# Query11: Return the name and id of the employees who has worked in all departments after hired by the company.
SELECT 		e.Employee_ID, p.fName, p.lname
	FROM 	EMPLOYEE e,
			PERSON p,
            EMPLOYEE_DEPARTMENT edh
	WHERE	e.Employee_ID = p.Personal_ID
		AND	e.Employee_ID = edh.Employee_ID
	GROUP BY e.Employee_ID, p.fName
	HAVING COUNT(DISTINCT edh.Department_ID) = (SELECT COUNT(*) FROM DEPARTMENT);

# Query12: Return the name and email address of the interviewee who is selected.
SELECT 		p.fName, p.lname, sc.email
	FROM 	SELECTED_CANDIDATES sc,
			person p
	WHERE 	p.personal_id = sc.candidate_id;

# Query13: Retrieve the name, phone number, email address of the interviewees selected for all the jobs they apply.
SELECT 		p.Fname, p.Lname, p.Pno AS Phone_Number, sc.Email, sc.Job_ID
	FROM	selected_candidates sc,
			person p
	WHERE	p.personal_id = sc.candidate_id;

# Query14: Return the employee’s name and id whose average monthly salary is highest in the company.
SELECT 		e.Employee_ID, p.fName, p.lname, AVG(s.Amount) AS Average_Monthly_Salary
	FROM 	EMPLOYEE e,
			PERSON p,
			SALARY s
	WHERE	e.Employee_ID = p.Personal_ID
		AND	e.Employee_ID = s.Employee_ID
	GROUP BY e.Employee_ID, p.fName
	ORDER BY Average_Monthly_Salary DESC
	LIMIT 1;

# Query15: Return the ID and Name of the vendor who supply part whose name is “Cup” and weight is smaller than 4 pound 
# and the price is lowest among all vendors.
SELECT 		v.Vendor_ID, v.Name AS Vendor_Name
	FROM 	PART_TYPE pt,
			VENDOR_PART vp,
            VENDOR v
	WHERE	pt.Part_Type_ID = vp.Part_Type_ID
		AND	vp.Vendor_ID = v.Vendor_ID
        AND	pt.Part_Type_Name = 'Cup'
		AND	pt.Weight < 4
	ORDER BY vp.Price ASC
	LIMIT 1;

