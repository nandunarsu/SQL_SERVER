use fundodb

select * from Notes;
select * from Users;
select * from Collaboration;

--select * from Collaboration c join Notes n on c.NoteId = n.NoteId join Users u on c.UserId = u.UserId where c.CollaborationId=5--

/*
create table Label(
LabelId int identity(1,1) primary key,
LabelName varchar(30),
NoteId int,
UserId int,
foreign key(NoteId) references Notes(NoteId),
foreign key(UserId) references Users(UserId)
);
*/

select * from Label;

select n.NoteId,l.LabelId,n.Title,n.Description,n.Colour,n.IsArchived,n.IsDeleted,l.LabelName from Notes n inner join  Label l on n.NoteId = l.NoteId where n.NoteId = 4;


