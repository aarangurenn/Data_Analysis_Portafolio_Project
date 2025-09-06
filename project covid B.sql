select 
	sum(new_cases) as total_cases,
    sum(new_deaths) as total_deaths,
    (sum(new_deaths)/sum(new_cases)) * 100 as Death_Percentage
    from covid_death
    where continent <> ''
    and location = 'Mexico'
    order by 1,2
    ;
    
    -- We take these out as they are not inluded in the above queries and want to stay consistent
	-- European Union is part of Europe
    
    select 
		location,
        sum(new_deaths) as Total_death_count
	from covid_death
	where continent = '' 
	and location not in ('World', 'European Union', 'International')
	group by location 
	order by Total_death_count desc
	;
    
select
	location,
    population, 
    max(total_cases) as highest_infection_count,
    ((max(total_cases)/population) * 100) as Percent_Population_Infected
    from covid_death
    group by location, population
    order by Percent_Population_Infected desc
    ;

select
	location,
    population, 
    date,
    max(total_cases) as highest_infection_count,
    ((max(total_cases)/population) * 100) as Percent_Population_Infected
    from covid_death
    group by location, population, date
    order by Percent_Population_Infected desc
        
	
     