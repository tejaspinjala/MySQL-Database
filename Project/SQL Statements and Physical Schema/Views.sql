use SemesterProject;

select * from view1;
select * from view2;
select * from view3;
select * from view4;

# View1: This view returns the average salary each employee has earned from the company 
# monthly after she/he becomes an employee in the company.
CREATE VIEW 	View1 AS
	SELECT 		Employee_ID, AVG(Amount) AS Average_Monthly_Salary
	FROM 		SALARY
	GROUP BY 	Employee_ID;

# View2: This view returns the number of interviews rounds each interviewee 
# pass for each job position.
CREATE VIEW		View2 AS
	SELECT		id.Candidate_ID, id.Job_ID, COUNT(ir.Round_Number) AS Passed_Rounds
    FROM		INTERVIEW_DETAILS id,
				INTERVIEW_ROUNDS ir
    WHERE		id.Interview_ID = ir.Interview_ID
		AND		ir.Pass_Round = TRUE
	GROUP BY	id.Candidate_ID, id.Job_ID;


# View3: This view returns the number of items of each product type sold.
CREATE VIEW 	View3 AS
	SELECT 		p.Product_Type AS Item, SUM(s.Quantity_Sold) AS Total_Items_Sold
	FROM 		PRODUCT p,
				SALE s
	WHERE		p.Product_ID = s.Product_ID
	GROUP BY 	p.Product_Type;

# View4: This view returns the part purchase cost for each product.
CREATE VIEW 	View4 AS
	SELECT		pp.Product_ID, pt.Part_Type_Name, vp.Price AS Part_Price, pp.Quantity AS Quantity_Required, 
				(vp.Price * pp.Quantity) AS Total_Part_Cost
	FROM		PRODUCT_PART pp,
				PART_TYPE pt,
				VENDOR_PART vp
	WHERE		pp.Part_Type_ID = pt.Part_Type_ID
		AND		pp.Part_Type_ID = vp.Part_Type_ID




