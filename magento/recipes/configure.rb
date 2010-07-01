include_recipe "deploy" # get the deployment attributes

node[:deploy].each do |application, deploy|

  template "#{deploy[:deploy_to]}/current/app/etc/local.xml" do
    source "local.xml.erb"
    mode "0660"
    group deploy[:group]
    owner deploy[:user]
    variables(:database => deploy[:database])
    
    only_if do
      File.directory?("#{deploy[:deploy_to]}/current/app/etc/local.xml")
    end
  end
end