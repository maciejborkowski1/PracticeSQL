DECLARE @f DECIMAL =1.1
SELECT @f/2 ,@f/4 ,@f/8 ,@f/16 ,@f/32 ,@f/64 ,@f/128 ,@f/256 ,@f/512 ,@f/1024 ,@f/2048 ,@f/4096 ,@f/8192 ,@f/16384 ,@f/32768 
GO

DECLARE @f REAL =1.1
SELECT @f/2 ,@f/4 ,@f/8 ,@f/16 ,@f/32 ,@f/64 ,@f/128 ,@f/256 ,@f/512 ,@f/1024 ,@f/2048 ,@f/4096 ,@f/8192 ,@f/16384 ,@f/32768 
GO

DECLARE @f FLOAT =1.1
SELECT @f/2 ,@f/4 ,@f/8 ,@f/16 ,@f/32 ,@f/64 ,@f/128 ,@f/256 ,@f/512 ,@f/1024 ,@f/2048 ,@f/4096 ,@f/8192 ,@f/16384 ,@f/32768 
GO

DECLARE @f MONEY =1.1
SELECT @f/2 ,@f/4 ,@f/8 ,@f/16 ,@f/32 ,@f/64 ,@f/128 ,@f/256 ,@f/512 ,@f/1024 ,@f/2048 ,@f/4096 ,@f/8192 ,@f/16384 ,@f/32768 
GO

DECLARE @f FLOAT = -1
PRINT @f +1
PRINT @f +0.5+0.5
PRINT @f +0.5+0.25+0.25
PRINT @f +0.1+0.1+0.1+0.1+0.1+0.1+0.1+0.1+0.1+0.1

DECLARE @d DATE = GetDate()
PRINT @d

DECLARE @d TIME = SYSDATETIME()
PRINT @d

DECLARE @d1 TIME = GetDate()
PRINT @d1

DECLARE @d SMALLDATETIME = GetDate()
PRINT @d

