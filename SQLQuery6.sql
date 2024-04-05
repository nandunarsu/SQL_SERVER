
use fundodb
CREATE TABLE Collaboration(
CollaborationId int identity(1,1),
UserId int FOREIGN KEY REFERENCES Users(UserId),
NoteId int FOREIGN KEY REFERENCES Notes(NoteId),
CollabEmail nvarchar(100) FOREIGN KEY REFERENCES Users(Email));

select * from Users;
select * From Notes;