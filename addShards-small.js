db.adminCommand({ addshard : "localhost:37017" });
db.adminCommand({ addshard : "localhost:47017" });

db.adminCommand({ enablesharding : "mongoose" });
