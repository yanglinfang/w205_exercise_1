#Sample code snippets for working with psycopg


#Connecting to a database
#Note: If the database does not exist, then this command will create the database


import psycopg2
import sys

conn = psycopg2.connect(database="postgres", user="postgres", password="pass", host="localhost", port="5432")

#Create a Table
#The first step is to create a cursor. 

#cur = conn.cursor()
#cur.execute('''DROP TABLE Tweetwordcount;''')
#cur.execute('''CREATE TABLE Tweetwordcount
#       (word TEXT PRIMARY KEY     NOT NULL,
#       count INT     NOT NULL);''')
#conn.commit()
#conn.close()


#Running sample SQL statements
#Inserting/Selecting/Updating

#Rather than executing a whole query at once, it is better to set up a cursor that encapsulates the query, 
#and then read the query result a few rows at a time. One reason for doing this is
#to avoid memory overrun when the result contains a large number of rows. 

cur = conn.cursor()

#Insert
#cur.execute("INSERT INTO Tweetwordcount (word,count) VALUES ('test', 1)");
#conn.commit()

#Update
#Assuming you are passing the tuple (uWord, uCount) as an argument

uWord = 'test2'
uCount = '2'

if sys.argv:
    print 'there are %s arg:' %(len(sys.argv))
    for arg in sys.argv: 
        print arg
		
    if len(sys.argv) > 1:
        print 'using second arg as uWord:', sys.argv[1]
        uWord = sys.argv[1]

# cur.execute("SELECT word, count from Tweetwordcount WHERE word=%s",[uWord]);
# records = cur.fetchall()
# if len(records) > 0:
	# print "found", len(records), "records, before update:"
	# for rec in records:
		# print "word = ", rec[0]
		# print "count = ", rec[1], "\n"
	# cur.execute("UPDATE Tweetwordcount SET count=%s WHERE word=%s", (uCount, uWord));
	# conn.commit()
# else:
	# print 'record does not exist, try insert'
	# cur.execute("INSERT INTO Tweetwordcount (word,count) VALUES (%s, %s)", (uWord, uCount));
	# conn.commit()
	
#Select
cur.execute("SELECT word, count from Tweetwordcount WHERE word=%s",[uWord]);
records = cur.fetchall()
print "found", len(records), "records:"
for rec in records:
   print "word = ", rec[0]
   print "count = ", rec[1], "\n"
conn.commit()

conn.close()
