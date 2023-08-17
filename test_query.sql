
SELECT   collaborators.id as id, collaborators.name as name,  
subdivisions.name as sub_name, collaborators.subdivision_id, 
len(replace(replace(replace(replace(subdivisions.name, ' ',''), '.', ''), 'Главное',''), 'Подразделение', '')) as sub_level,
(SELECT COUNT(*) from collaborators as col where collaborators.subdivision_id=col.subdivision_id) as colls_count
FROM subdivisions join collaborators on collaborators.subdivision_id=subdivisions.id 
where substring(replace(replace(replace(replace(subdivisions.name, ' ',''), '.', ''), 'Главное',''), 'Подразделение', ''), 1, 1)='1' 
AND len(replace(replace(replace(replace(subdivisions.name, ' ',''), '.', ''), 'Главное',''), 'Подразделение', ''))>1 
AND collaborators.age<40 AND len(collaborators.name)>11
AND collaborators.subdivision_id NOT IN ('100055', '100059')
order by sub_level ASC









