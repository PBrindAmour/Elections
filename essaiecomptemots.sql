CREATE FUNCTION [dbo].[WordCount] ( @InputString VARCHAR(4000) ) 
RETURNS INT
AS
BEGIN

DECLARE @Index          INT
DECLARE @PremiereLettre           CHAR(1)
DECLARE @LongueurMot       CHAR(1)
DECLARE @Mot            VARCHAR(50)
DECLARE @WordCount      INT
DECLARE @TableMots TABLE(Mot varchar(50), Occurence INT)


SET @Index = 1
SET @WordCount = 0

WHILE @Index <= LEN(@InputString)
BEGIN
    SET @Char     = SUBSTRING(@InputString, @Index, 1)
    IF @Char = ' '

    SET @PrevChar = CASE WHEN @Index = 1 THEN ' '
                         ELSE SUBSTRING(@InputString, @Index - 1, 1)
                    END

    IF @PrevChar = ' ' AND @Char != ' '
        SET @WordCount = @WordCount + 1

    SET @Index = @Index + 1
END

RETURN @WordCount

END
GO

DECLARE @String VARCHAR(4000)
SET @String = 'essaye essaye pas mais essaye pour vrai'

SELECT [dbo].[WordCount] ( @String )