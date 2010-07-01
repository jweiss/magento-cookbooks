package "pound" do
  action :install
end

template "/etc/pound/pound.cfg" do
  source "pound.cfg.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, resources(:service => "pound")
end

service "pound" do
  supports :restart => true, :status => true, :reload => true
  action [:enable, :start]
end
