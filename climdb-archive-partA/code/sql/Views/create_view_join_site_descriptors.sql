CREATE VIEW dbo.vw_join_site_descriptors
AS
select s.site_name,
rs.res_site_id, rs.site_id, rs.res_site_parent_id, rs.res_site_code, rs.res_site_name
, t.descriptor_type_name, d.descriptor_value, t.descriptor_type_unit
from dbo.research_site rs
inner join dbo.site s
on rs.site_id = s.site_id
--
inner join dbo.research_site_descriptor d
on rs.res_site_id = d.res_site_id
--
inner join dbo.descriptor_type t
on d.descriptor_type_id = t.descriptor_type_id
--
where d.descriptor_type_id in (7,8,21,22, 165, 166,167,168, 188, 189, 190, 191)
and d.descriptor_value is not null
and d.descriptor_value not like ''
--
order by s.site_name, rs.res_site_name
;

