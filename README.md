# sinatra_demo
sinatra项目


ruby 2.6.1

#安装gem
bundle install
#创建数据库
bundle exec rake db:setup
#启动服务 
thin -R config.ru start
#进入控制台
pry -r ./console.rb