1. connect to AWS machine as root. 
2. make sure disk is mounted, by running fdisk -l, also make sure database postgres exists, and table tweetwordcount exists.
3. start hadoop by running /root/start-hadoop.sh
4. start postgres by running /data/start_postgres.sh
5. cd /root/exercise_2/tweetwordcount
6. sparse run
7. monitor the run, wait until the queue is empty.
8. use Ctrl+c to stop execution 
9. go back to root by running cd ~
10. check DB result by running python /root/exercise_2/finalresults.py <supply_your_word_param_here>, or run without parameter to get all counts. 
11. check histogram by running python /root/exercise_2/histogram.py <lower_count_limit,upper_count_limit>
