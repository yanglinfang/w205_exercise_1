import psycopg2
import sys

conn = psycopg2.connect(database="postgres", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()

lowerLim = '0'
upperLim = '0'
if len(sys.argv) > 1:
    lowerLim = sys.argv[1].split(',', 1)[0]
    print 'lowerLim is', lowerLim
    upperLim = sys.argv[1].split(',', 1)[1]
    print 'upperLim is', upperLim
    cur.execute("SELECT word, count from Tweetwordcount WHERE count >= %s AND count <= %s",(lowerLim, upperLim));
    records = cur.fetchall()
    for rec in records:
        print 'Total number of occurences of "%s": %s.' % (rec[0], rec[1])

    conn.commit()
    conn.close()