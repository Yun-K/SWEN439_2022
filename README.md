# introduction

This repo contains all my assignments and the project 1 for SWEN439, 2022.



# Marks

## assignments

#### Assignment_1Final Mark: 93

| Question   | Comment                                                      | Mark     |
| :--------- | :----------------------------------------------------------- | :------- |
| Question 1 |                                                              | 20 / 20  |
| Question 2 |                                                              | 10 / 10  |
| Question 3 |                                                              | 20 / 20  |
| Question 4 | a) -1 entity cannot refer to another object, -1 publisher? -2 justifications? | 26 / 30  |
| Question 5 | -3 for the last part, it may be better to consider expense as a relation pointing to shipment, as expense relates to each individual shipment (shipments may exist without expenses if it has not been calculated yet), but it does not make sense for a shipment to relate to an expense, (think about where the arrows point to). | 17 / 20  |
| Final      |                                                              | 93 / 100 |

#### Assignment_2Final Mark: 86.45

| Question     | Comment                                                      | Mark        |
| :----------- | :----------------------------------------------------------- | :---------- |
| Question 1   | a 2: πname (σcategory=’food’ ((Products * Supplied_By) * Company)) - πname (σcategory≠’food’ ((Products * Supplied_By) * Company )) 5: πNane (Company * ( πCId (Supplied_By ) - πCId (πCId (Company) x πPId (Products) - πCid, PId (Supplied_By)))) | 33 / 40     |
| Question 2   | b2: check your calculation of projection.                    | 38 / 40     |
| Question 3   | Good job.                                                    | 20 / 20     |
| Late Penalty |                                                              | -4.55       |
| Final        |                                                              | 86.45 / 100 |

#### Assignment_3Final Mark: 93

| Question   | Comment                                                      | Mark     |
| :--------- | :----------------------------------------------------------- | :------- |
| Question 1 | great                                                        | 16 / 16  |
| Question 2 | -2 some steps skipped to get to AB->CE, should use the basic Armstrong rules. C cannot be said to be a subset of AB. | 7 / 9    |
| Question 3 | great                                                        | 20 / 20  |
| Question 4 | 4) -2 need to show that sequentially joining the tables have keys in their intersection, resulting in a lossless recovery of the original relation; see slides | 23 / 25  |
| Question 5 | 3, 4) -3 BC->A and BC-> should be lost, a new relation with these FDs cannot simply be added | 27 / 30  |
| Final      |                                                              | 93 / 100 |

## project

#### Project_1Final Mark: 96

| Question   | Comment                                                      | Mark     |
| :--------- | :----------------------------------------------------------- | :------- |
| Question 1 |                                                              | 15 / 15  |
| Question 2 |                                                              | 15 / 15  |
| Question 3 | 6) -1 you can ignore the empty fields                        | 9 / 10   |
| Question 4 | 4) -3 incorrect, use except select to exclude banks that have a branch in chicago | 21 / 24  |
| Question 5 |                                                              | 20 / 20  |
| Question 6 |                                                              | 16 / 16  |
| Final      |                                                              | 96 / 100 |

#### Project_2Final Mark: 100

| Question               | Comment  | Mark      |
| :--------------------- | :------- | :-------- |
| Java can compiled      |          | 5 / 5     |
| Implement DB           |          | 1 / 1     |
| Book Look up           |          | 5 / 5     |
| Show catalogue         |          | 5 / 5     |
| Show loaned books      |          | 5 / 5     |
| Borrow book            |          | 30 / 30   |
| Exit Function          |          | 4 / 4     |
| Show author            |          | 5 / 5     |
| Show all the authors   |          | 5 / 5     |
| Show customer          |          | 5 / 5     |
| Show all the customers |          | 5 / 5     |
| Return book            |          | 10 / 10   |
| Delete customer        |          | 6 / 6     |
| Delete author          |          | 3 / 3     |
| Delete book            | good job | 6 / 6     |
| Final                  |          | 100 / 100 |
