INSERT INTO [BDGFiveFinanzas].[dbo].[Usuario]
           ([nombreUsuario]
           ,[idUsuario]
           ,[contraseña]
           ,[estado]
           ,[intentos])
     VALUES
           ('MIGUEL'
           ,1
           ,'MIGUEL'
           ,'1'
           ,0)
GO

INSERT INTO [BDGFiveFinanzas].[dbo].[Usuario]
           ([nombreUsuario]
           ,[idUsuario]
           ,[contraseña]
           ,[estado]
           ,[intentos])
     VALUES
           ('CESAR'
           ,2
           ,'CESAR'
           ,'1'
           ,0)
GO

INSERT INTO [BDGFiveFinanzas].[dbo].[Cliente]
      ([cli_ruc]
      ,[cli_razonSocial]
      ,[cli_lineaCreditoTotal]
      ,[cli_lineaCreditoSaldo]
      ,[estado])
     VALUES
           ('10203040501'
           ,'CLIENTE DE PRUEBA'
           ,50000.00
           ,50000.00
           ,1)
GO

INSERT INTO [BDGFiveFinanzas].[dbo].[Pedido]
      ([idPedido]
      ,[situacion]
      ,[montoTotal]
      ,[cli_ruc]
      ,[estado])
     VALUES
           (90001
           ,'pendiente'
           ,20000.00
           ,'10203040501'
           ,1)
GO

INSERT INTO [BDGFiveFinanzas].[dbo].[Pedido]
      ([idPedido]
      ,[situacion]
      ,[montoTotal]
      ,[cli_ruc]
      ,[estado])
     VALUES
           (90002
           ,'pendiente'
           ,70000.00
           ,'10203040501'
           ,1)
GO

INSERT INTO [BDGFiveFinanzas].[dbo].[Pedido]
      ([idPedido]
      ,[situacion]
      ,[montoTotal]
      ,[cli_ruc]
      ,[estado])
     VALUES
           (90003
           ,'observado'
           ,20000.00
           ,'10203040501'
           ,1)
GO

INSERT INTO [BDGFiveFinanzas].[dbo].[Pedido]
      ([idPedido]
      ,[situacion]
      ,[montoTotal]
      ,[cli_ruc]
      ,[estado])
     VALUES
           (90004
           ,'aprobado'
           ,20000.00
           ,'10203040501'
           ,1)
GO