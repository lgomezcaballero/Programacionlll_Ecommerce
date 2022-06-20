Use Ecommerce_Programacionlll
go
Create Procedure SP_ListarArticulos
As
Begin
	select a.IDArticulo, a.Nombre Articulo, a.Descripcion, a.Precio, a.Stock, a.FechaRegistro, a.Estado EstadoArticulo,
	m.IDMarca, m.Nombre Marca, m.FechaRegistro FechaRegistroMarca, m.Estado EstadoMarca, c.IDCategoria, c.Nombre Categoria,
	c.FechaRegistro FechaRegistroCategoria, c.Estado EstadoCategoria, g.IDGenero, g.Nombre Genero, g.Estado EstadoGenero 
	From Articulos a Left Join Marcas m on a.IDMarca = m.IDMarca 
	Left Join Categorias c on a.IDCategoria = c.IDCategoria 
	Left Join Generos g on a.IDGenero = g.IDGenero
	Where a.Estado = 1
End
go
Create Procedure SP_AgregarArticulo(
	@idMarca smallint,
	@idCategoria smallint,
	@idGenero tinyint,
	@nombre varchar(200),
	@descripcion varchar(500),
	@precio money,
	@stock bigint
)
As
Begin
	Begin Try
		Begin Transaction
			Insert into Articulos (IDMarca, IDCategoria, IDGenero, Nombre, Descripcion, Precio, Stock)
			values (@idMarca, @idCategoria, @idGenero, @nombre, @descripcion, @precio, @stock)
		Commit Transaction
	End Try
	Begin Catch
		RAISERROR('Error, no se pudo agregar el articulo', 16, 1)
		Rollback Transaction
	End Catch
End
go
Create Procedure SP_ModificarArticulo(
	@idArticulo bigint,
	@idMarca smallint,
	@idCategoria smallint,
	@idGenero tinyint,
	@nombre varchar(200),
	@descripcion varchar(500),
	@precio money,
	@stock bigint
)
As
Begin
	Begin Try
		Begin Transaction
			Update Articulos Set IDMarca = @idMarca, IDCategoria = @idCategoria, IDGenero = @idGenero, Nombre = @nombre,
			Descripcion = @descripcion, Precio = @precio, Stock = @stock Where IDArticulo = @idArticulo
		Commit Transaction
	End Try 
	Begin Catch
		RAISERROR('Error, no se pudo modificar el articulo', 16, 1)
		Rollback Transaction
	End Catch
End
go
Create Procedure SP_EliminarArticulo(
	@idArticulo bigint
)
As
Begin
	Begin Try
		Delete From Articulos Where IDArticulo = @idArticulo
	End Try
	Begin Catch
		RAISERROR('Error, no se pudo eliminar el articulo', 16, 1)
	End Catch
End
go
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
Create Procedure SP_ListarCategorias
As
Begin
	Select IDCategoria, Nombre, FechaRegistro, Estado From Categorias Where Estado = 1
End
go
Create Procedure SP_AgregarCategoria(
	@nombre varchar(50)
)
As
Begin
	Begin Try
		Begin Transaction
			Insert into Categorias (Nombre) values (@nombre)
		Commit Transaction
	End Try
	Begin Catch
		RAISERROR('Error, no se pudo agregar la categoria', 16, 1)
		Rollback Transaction
	End Catch
End
go
Create Procedure SP_ModificarCategoria(
	@idCategoria smallint,
	@nombre varchar(50)
)
As
Begin
	Begin Try
		Begin Transaction
			Update Categorias Set Nombre = @nombre Where IDCategoria = @idCategoria
		Commit Transaction
	End Try 
	Begin Catch
		RAISERROR('Error, no se pudo modificar la categoria', 16, 1)
		Rollback Transaction
	End Catch
End
go
Create Procedure SP_EliminarCategoria(
	@idCategoria smallint
)
As
Begin
	Begin Try
		Delete From Categorias Where IDCategoria = @idCategoria
	End Try
	Begin Catch
		RAISERROR('Error, no se pudo eliminar el articulo', 16, 1)
	End Catch
End
go
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
Create Procedure SP_ListarImagenesArticulo(
	@idArticulo bigint
)
As
Begin
	Select IDImagen, URLImagen, Estado From Imagenes Where IDArticulo = @idArticulo
End
go
Create Procedure SP_AgregarImagen(
	@idArticulo bigint,
	@urlImagen varchar(300)
)
As
Begin
	Begin Try
		Begin Transaction
			Insert into Imagenes(IDArticulo, URLImagen) values (@idArticulo, @urlImagen)
		Commit Transaction
	End Try
	Begin Catch
		RAISERROR('Error, no se pudo agregar la imagen', 16, 1)
		Rollback Transaction
	End Catch
End
go
Create Procedure SP_ModificarImagen(
	@idImagen bigint,
	@idArticulo bigint,
	@urlImagen varchar(300)
)
As
Begin
	Begin Try
		Begin Transaction
			Update Imagenes Set IDArticulo = @idArticulo, URLImagen = @urlImagen Where IDImagen = @idImagen
		Commit Transaction
	End Try 
	Begin Catch
		RAISERROR('Error, no se pudo modificar la imagen', 16, 1)
		Rollback Transaction
	End Catch
End
go
Create Procedure SP_EliminarImagen(
	@idImagen bigint
)
As
Begin
	Begin Try
		Delete From Imagenes Where IDImagen = @idImagen
	End Try
	Begin Catch
		RAISERROR('Error, no se pudo eliminar la imagen de articulo', 16, 1)
	End Catch
End
go
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
Create Procedure SP_ListarMarcas
As
Begin
	Select IDMarca, Nombre, FechaRegistro, Estado From Marcas
End
go
Create Procedure SP_ListarUsuarios
As
Begin
	Select u.IDUsuario, u.Apellidos, u.Nombres, u.DNI, u.NombreUsuario, u.Contrase�a, u.Estado EstadoUsuario, 
	tu.IDTipoUsuario, tu.Nombre TipoUsuario, tu.Estado EstadoTipoUsuario, c.IDUsuario, c.Email, c.Telefono, 
	c.Estado EstadoContacto, l.IDLocalidad, l.CP CodigoPostal, l.Nombre NombreLocalidad, l.Estado EstadoLocalidad, 
	p.IDProvincia, p.Nombre Provincia, p.Estado EstadoProvincia, pa.IDPais, pa.Nombre Pais, pa.Estado EstadoPais
	From Usuarios u Inner Join TiposUsuarios tu on u.IDTipoUsuario = tu.IDTipoUsuario
	Inner Join Contactos c on u.IDUsuario = c.IDUsuario
	Inner Join Localidad l on u.IDLocalidad = l.IDLocalidad
	Inner Join Provincias p on l.IDProvincia = p.IDProvincia
	Inner Join Pais pa on p.IDPais = pa.IDPais
End
go