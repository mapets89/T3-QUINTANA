USE CATALOGO_DB
ALTER TABLE dbo.ARTICULOS
ADD ALTA INT NOT NULL 
DEFAULT '1'

USE CATALOGO_DB
ALTER TABLE dbo.ARTICULOS
ADD CANTIDAD INT NOT NULL 
DEFAULT '1'

SELECT * from marcas
insert into categorias values ('Notebook')

USE CATALOGO_DB
SELECT * FROM ARTICULOS