# sinatra_demo
sinatra项目


ruby 2.6.1

#安装gem
bundle install
#创建数据库  迁移
bundle exec rake db:setup    rake db:migrate
#启动服务 
thin -R config.ru start
#进入控制台
pry -r ./console.rb

#接口测试
curl -H "Content-Type: application/json"  -d "{\"a\":\"A\",\"b\":\"B\"}" “your api url” -X POST 


curl -H "Content-Type: application/json"  -d "{\"name\":\"b_c\",\"type\":\"test\"}" -X POST “http://0.0.0.0:3000/book/create”
