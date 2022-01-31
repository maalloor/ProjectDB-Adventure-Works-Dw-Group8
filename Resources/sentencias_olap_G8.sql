# ROLL-UP: REPORTE DE LAS VENTAS REALIZADAS POR AÑO EN CADA PAÍS.
select dd.calendaryear, ds.salesterritorycountry,
        sum(f.orderquantity) total_quantity
from factinternetsales f
join dimdate dd ON dd.datekey = f.orderdatekey
join dimsalesterritory ds ON ds.salesterritorykey = f.salesterritorykey
group by rollup(dd.calendaryear, ds.salesterritorycountry)
order by dd.calendaryear DESC;

# DICE: REPORTE DE LAS VENTAS REALIZADAS Y DE LA CANTIDAD DE PRODUCTOS COMPRADOS POR CLIENTES DE GENERO MASCULINO NACIDOS EN EL AÑO 1967.
select dd.calendaryear, dd.monthnumberofyear, dd.daynumberofmonth, f.customerkey, dc.firstname, dc.lastname,
    dc.yearlyincome, dc.birthdate, dc.gender, sum(f.orderquantity) total_quantity
from factinternetsales f
join dimdate dd ON dd.datekey = f.orderdatekey
join dimcustomer dc ON dc.customerkey = f.customerkey
where (extract(YEAR FROM dc.birthdate) = 1967)
    and dc.gender = 'M'
group by (dd.calendaryear, dd.monthnumberofyear, dd.daynumberofmonth, f.customerkey, dc.firstname, dc.lastname, 
dc.yearlyincome, dc.birthdate, dc.gender)
order by dd.calendaryear DESC;

# DRILL DOWN: REPORTE DE TODAS LAS VENTAS REALIZADAS POR FECHA Y POR CLIENTES.
select dd.calendaryear, dd.monthnumberofyear, dd.daynumberofmonth, f.customerkey, dc.firstname, dc.lastname,
    dc.yearlyincome, dc.birthdate, dc.gender, sum(f.orderquantity) total_quantity
from factinternetsales f
join dimdate dd ON dd.datekey = f.orderdatekey
join dimcustomer dc ON dc.customerkey = f.customerkey
group by (dd.calendaryear, dd.monthnumberofyear, dd.daynumberofmonth, f.customerkey, dc.firstname, dc.lastname, 
dc.yearlyincome, dc.birthdate, dc.gender)
order by dd.calendaryear DESC;