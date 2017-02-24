UPDATE t1
  SET t1.description = CONCAT(RTRIM(t2.title), '-', RTRIM(t3.name))
  FROM dbo.MovieCategory AS t1
  INNER JOIN dbo.Movie AS t2
  ON t1.idmovie = t2.idmovie
  INNER JOIN dbo.Category AS t3
  ON t1.idcategory = t3.idcategory;