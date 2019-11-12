while :
do
    echo "downsample/samples/1.bmp" | nc -U ost_sock && sleep 0.3
    echo "downsample/samples/2.bmp" | nc -U ost_sock && sleep 0.3
    echo "downsample/samples/3.bmp" | nc -U ost_sock && sleep 0.3
    echo "downsample/samples/4.bmp" | nc -U ost_sock && sleep 0.3
    echo "downsample/samples/5.bmp" | nc -U ost_sock && sleep 0.3
    echo "downsample/samples/6.bmp" | nc -U ost_sock && sleep 0.3
    echo "downsample/samples/7.bmp" | nc -U ost_sock && sleep 0.3
done
