import psycopg2
import sys

conn = psycopg2.connect(database="postgres", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()

uWord = ''
if len(sys.argv) > 1:
    uWord = sys.argv[1]
    cur.execute("SELECT word, count from Tweetwordcount WHERE word=%s",[uWord]);
    records = cur.fetchall()
    for rec in records:
        print 'Total number of occurences of "%s": %s.' % (rec[0], rec[1])

else:
    cur.execute("SELECT word, count from Tweetwordcount ORDER BY word ASC");
    records = cur.fetchall()
    for rec in records:
        print 'Total number of occurences of "%s": %s.' % (rec[0], rec[1])


conn.commit()
conn.close()