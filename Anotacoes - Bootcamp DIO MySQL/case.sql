-- CASE: Similar ao Switch Case
	-- pode ser usado osiznho ou DENTRO DE UM STATMENT
	-- Pode ainda SER valor. EX: "update employee set salary= CASE WHEN Dno=5 THEN Salary+ 2000 WHEN Dno=..."
    -- SELECT report_code, yearm month, day, wind_speed, 
		-- CASE
		-- WHEN wind_speed>= 40 THEN 'HIGHT'
        -- WHEN wind_speed>= 30 AND wind_speed< 40 THEN 'MODERATE'
        -- ELSE 'LOW'
        -- END /*aqui finaliza o CASE*/ AS wind_severity /*aqui eu dou um apelido p doluna dele*/
	-- FROM station_data;
        
	-- PODE SER USADO COMO ATRIBUTO DE UM FUNÇÃO
		-- select ano, mes, SUM(CASE WHEN tornado= 1 THEN precipitation ELSE 0 END) AS tornado_precipitatio, 
							/*se o valor for 1, mostre o valor de precipitation, se n for 1 então vai valer 0. FAÇA ISSO P TDS LINHAS. finalize*/
						 -- SUM(CASE WHEN tornado= 0 THEN precipitation ELSE 0 END) AS  non_tornado_precipitatio
							-- FROM station_data GROUP BY ano, mes;
						
	-- 									TESTES
	use company_constraints;
    show tables;
    update employee set Salary= CASE
									WHEN Dno= 5 THEN Salary- 2000
                                    WHEN Dno= 4 THEN Salary- 1500
                                    WHEN Dno= 1 THEN Salary- 3000
                                    ELSE Salary+ 0
								END;
select* from employee;                                
                                