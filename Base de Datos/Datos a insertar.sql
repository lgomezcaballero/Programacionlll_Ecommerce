Use Ecommerce_Programacionlll
go
Insert into Generos (Nombre) values ('Masculino')
go
Insert into Generos (Nombre) values ('Femenino')
go
Insert into Tallas(Talla) values ('XS')
go
Insert into Tallas(Talla) values ('S')
go
Insert into Tallas(Talla) values ('M')
go
Insert into Tallas(Talla) values ('L')
go
Insert into Tallas(Talla) values ('XL')
go
Insert into Tallas(Talla) values ('XXL')
go
Insert into Tallas(Talla) values ('XXXL')
go
Insert into Tallas(Talla) values ('30')
go
Insert into Tallas(Talla) values ('31')
go
Insert into Tallas(Talla) values ('32')
go
Insert into Tallas(Talla) values ('33')
go
Insert into Tallas(Talla) values ('34')
go
Insert into Tallas(Talla) values ('35')
go
Insert into Tallas(Talla) values ('36')
go
Insert into Tallas(Talla) values ('37')
go
Insert into Tallas(Talla) values ('38')
go
Insert into Tallas(Talla) values ('39')
go
Insert into Tallas(Talla) values ('40')
go
Insert into Tallas(Talla) values ('41')
go
Insert into Tallas(Talla) values ('42')
go
Insert into Tallas(Talla) values ('43')
go
Insert into Tallas(Talla) values ('44')
go
Insert into Tallas(Talla) values ('45')
go
Insert into Tallas(Talla) values ('46')
go
Insert into Categorias (Nombre, FechaRegistro) values ('Camperas', GETDATE())
go
Insert into Categorias (Nombre, FechaRegistro) values ('Blusas', GETDATE())
go
Insert into Categorias (Nombre, FechaRegistro) values ('Remeras', GETDATE())
go
Insert into Categorias (Nombre, FechaRegistro) values ('Jeans', GETDATE())
go
Insert into Marcas (Nombre, FechaRegistro) values ('Northland', GETDATE())
go
Insert into Marcas (Nombre, FechaRegistro) values ('Mirta Armesto Acetato', GETDATE())
go
Insert into Marcas (Nombre, FechaRegistro) values ('Levi�s', GETDATE())
go
Insert into Marcas (Nombre, FechaRegistro) values ('Billabong', GETDATE())
go
Insert into Articulos (IDMarca, IDCategoria, IDGenero, IDTalla, Nombre, Descripcion, Precio, Stock, FechaRegistro) 
values (1, 1, 1, 1, 'Campera Impermeable Northland', 'Campera desmontable y muy vers�til. Podes usar las prendas juntas o por separado.', 
59990, 200, GETDATE())
go
Insert into Articulos (IDMarca, IDCategoria, IDGenero, IDTalla, Nombre, Descripcion, Precio, Stock, FechaRegistro)
values (2, 2, 2, 2, 'Blusa College Mirta Armesto Acetato Lycra Encaje', 
'Delicada blusa manga larga a la cintura. Detalle de encaje en hombros y mangas.', 6499, 150, GETDATE())
go
Insert into Articulos (IDMarca, IDCategoria, IDGenero, IDTalla, Nombre, Descripcion, Precio, Stock, FechaRegistro) 
values (3, 3, 1, 3, 'Remera Hombre Levi�s Graphic Set In Neck Batwing Black', ' Hechas de suave tejido de punto Jersey, esta remera tiene un fit slim 
y est� elaborada 100% de algod�n', 6390, 220, GETDATE())
go
Insert into Articulos (IDMarca, IDCategoria, IDGenero, IDTalla, Nombre, Descripcion, Precio, Stock, FechaRegistro) 
values (4, 4, 2, 4, 'Pantal�n Billabong Last Rays Beachpant Mujer', 'Pantal�n palazzo con cintura el�stica, con bolsillos laterales.', 5999, 350,
GETDATE())
go
Insert Into Imagenes (IDArticulo, URLImagen) values (1, 'https://http2.mlstatic.com/D_NQ_NP_858950-MLA45835722992_052021-W.webp')
go
Insert Into Imagenes (IDArticulo, URLImagen) values (1, 'https://http2.mlstatic.com/D_942675-MLA45835796221_052021-O.jpg')
go
Insert Into Imagenes (IDArticulo, URLImagen) values (2, 'https://http2.mlstatic.com/D_NQ_NP_757040-MLA49976265910_052022-W.webp')
go
Insert Into Imagenes (IDArticulo, URLImagen) values (2, 'https://http2.mlstatic.com/D_NQ_NP_899744-MLA49760282678_042022-O.webp')
go
Insert Into Imagenes (IDArticulo, URLImagen) values (3, 'https://http2.mlstatic.com/D_NQ_NP_883558-MLA49794535519_042022-W.webp')
go
Insert Into Imagenes (IDArticulo, URLImagen) values (3, 'https://http2.mlstatic.com/D_NQ_NP_657134-MLA49794595040_042022-O.webp')
go
Insert Into Imagenes (IDArticulo, URLImagen) values (4, 'https://http2.mlstatic.com/D_NQ_NP_756798-MLA49840887741_052022-W.webp')
go
Insert Into Imagenes (IDArticulo, URLImagen) values (4, 'https://http2.mlstatic.com/D_614858-MLA49840887742_052022-O.jpg')
go
Insert into TiposUsuarios (Nombre) values ('Administrador')
go
Insert into Pais(Nombre) values ('Argentina')
go
Insert into Provincias(IDPais, Nombre) values (1, 'Buenos Aires')
go
Insert into Localidad(CP, IDProvincia, Nombre) values ('B1648', 1, 'Tigre')
go
select * from Articulos