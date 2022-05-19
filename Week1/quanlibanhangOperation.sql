SELECT C.cName, O.oDate, SUM(OD.odQTY), P.pName
FROM customer AS C
INNER JOIN `order` AS O ON C.cID = O.cID
INNER JOIN orderdetail AS OD ON OD.oID = O.oID
INNER JOIN product AS P ON P.pID = OD.pID
GROUP BY P.pName, cName,O.oDate; 

SELECT O.oID , O.oDate, OD.oID, OD.odQTY, P.pPrice, SUM(OD.odQTY*P.pPrice) AS 'Total Price'
FROM  `order` AS O 
INNER JOIN orderdetail AS OD ON OD.oID = O.oID
INNER JOIN product AS P ON P.pID = OD.pID
GROUP BY O.oID; 

SELECT C.cName, C.cAge, O.oID, O.cID
FROM customer AS C
LEFT JOIN `order` AS O ON C.cID = O.cID and O.cID is null;
