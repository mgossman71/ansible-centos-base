cd /etc/systemd/system
for i in $(ls|grep consul)
do
  consul kv put $(hostname)$(pwd)/$i \@$i
done

cd /usr/local/etc/
for i in $(ls)
  do consul kv put $(hostname)$(pwd)/$i \@$i
done

cd /usr/local/bin/
for i in $(ls|grep start)
  do consul kv put $(hostname)$(pwd)/$i \@$i
done

cd /etc/selinux/
consul kv put $(hostname)$(pwd)/config \@$config
