select *
from NetflixData

Select *, Revenue - Net_Income as Cost 
from NetflixData 
order by 1 ASC

Alter Table NetflixData 
Alter Column Revenue Numeric (10,0)

Alter Table NetflixData 
Alter Column Net_Income Numeric (10,0)

Alter Table NetflixData 
Add Cost Numeric (10,0);

Update NetflixData 
Set Cost = Revenue - Net_Income


Create View GrowthRate as
Select Year, Revenue, Cost, Net_Income,
round(Total_Liabilities/Total_Equity,2) as Debt_to_Equity_ratio ,
Lag(Net_Income) over (Order by year) AS previous_year_profit,
Case 
When Lag(Revenue) Over (Order by year) IS NULL Then NUll
Else (Revenue - Lag(Revenue) Over (Order BY year))/ Lag(Revenue) OVER (Order by Year) * 100
End as rev_growth_rate,
Case 
When Lag(Net_Income) Over (Order by year) IS NULL Then NUll
Else (Net_Income - Lag(Net_Income) Over (Order BY year))/ Lag(Net_Income) OVER (Order by Year) * 100
End as profit_growth_rate
From NetflixData
Order by 1


Select *
from GrowthRate