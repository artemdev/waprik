cd ..
#1402562412
ls
#1402562416
cd 1
#1402562417
ls
#1402562432
remove-mod-tmp.pl
#1402562440
cd tmp
#1402562440
ls
#1402562450
ccd backup
#1402562454
cd backup
#1402562454
ls
#1402562458
cd ..
#1402562462
ls
#1402562465
cd tmp
#1402562465
ls
#1402562472
cd ..
#1402562474
cd ..
#1402562475
ls
#1402562477
cd backup/
#1402562484
cd home
#1402562485
ls
#1402562487
cd 1
#1402562487
ls
#1402562491
cd 1174
#1402562493
ls
#1402562496
cd 195
#1402562497
ls
#1402562498
cd ..
#1402562502
cd 195
#1402562502
ls
#1402562505
d ..
#1402562508
cd ..
#1402562511
cd ..
#1402562513
stat 1
#1402562523
du -sh 1
#1402562529
ls
#1402562534
du -sh waprik
#1402562556
cd waprik
#1402562556
ls
#1402562564
ls
#1402562573
mv public ..
#1402562584
su
#1402562599
ls
#1402562604
rm -rf *
#1402562607
ls
#1402562611
git pull waprik master
#1402562619
git merger
#1402562621
git merge
#1402562632
git status
#1402562640
rm -rf .git
#1402562641
ls
#1402562647
git init
#1402562680
git add remote waprik root@85.25.235.31:/home/git/waprik.git
#1402562690
git remote add waprik root@85.25.235.31:/home/git/waprik.git
#1402562697
git pull waprik master
#1402562719
git status
#1402562723
git add .
#1402562726
git status
#1402562731
git commit -am 'test'
#1402562734
git status
#1402562738
git pull waprik master
#1402562743
ls
#1402562746
git checkout
#1402562750
ls
#1402562757
git branch
#1402562762
rm -rf .git
#1402562763
ls
#1402562765
ls -la
#1402562768
git init
#1402562771
git add .
#1402562772
ls
#1402562774
git status
#1402562789
git commit -am 'init'
#1402562818
git remote add waprik root@85.25.235.31:/home/git/waprik.git
#1402562823
git pull waprik master
#1402562892
ls
#1402562909
git status
#1402562923
git commit -am 'test'
#1402562925
git status
#1402562937
git pull waprik master
#1402562950
nano .gitignore
#1402563002
git commit -am 'test'
#1402563008
git pull waprik master
#1402563037
nano config/database.yml
#1402563045
ls
#1402563047
pwd
#1402563051
cd config
#1402563052
ls
#1402563069
touch database.yml
#1402563071
ls
#1402563078
ls
#1402563083
nano config/database.yml
#1402563357
ls
#1402563364
nano database.yml 
#1402563580
mysql -u artem -pjU3dnBd9Js32g
#1402563588
mysql -u artem -pjU3dnBd9Js32g waprik_production
#1402563599
mysql -u artem -pjU3dnBd9Js32g
#1402563633
cd ..
#1402563644
RAILS_ENV=production rake db:migrate
#1402563652
bundle install
#1402563666
RAILS_ENV=production rake db:migrate
#1402563702
nano config/database.yml 
#1402563719
RAILS_ENV=production rake db:migrate
#1402563798
mysql -u artem -pjU3dnBd9Js32g waprik_production < waprik_films.sql
#1402563803
RAILS_ENV=production rake db:migrate
#1402563851
nano log/production.log 
#1402563870
cd app/
#1402563871
ls
#1402563873
cd views
#1402563874
ls
#1402563878
cd public/
#1402563878
ls
#1402563881
cd ..
#1402563888
cd ..
#1402563927
lsof -wni tcp:4100
#1402563937
lsof -wni tcp:4000
#1402563953
nano /etc/nginx/nginx.conf 
#1402563977
kill -QUIT 6514
#1402563983
lsof -wni tcp:4000
#1402563988
kill -QUIT 10741
#1402564000
kill -QUIT 11040
#1402564004
lsof -wni tcp:4000
#1402564009
kill -QUIT 29379
#1402564050
unicorn -c ../config/unicorn.rb -E production -p 4000 -D
#1402564059
cd ..
#1402564068
unicorn -c config/unicorn.rb -E production -p 4000 -D
#1402564108
ls
#1402564118
cd public
#1402564121
cd ..
#1402564122
ls
#1402564128
su
#1402564236
cd waprik
#1402564237
ls
#1402564241
bundle exec sidekiq -d -L sidekiq.log -q mailer,5 -q default -e production
#1402564244
ls
#1402564254
git status
#1402564274
nano .gitignore 
#1402564347
nano log/production.log 
#1402564422
lsof -wni tcp:4000
#1402564431
kill -QUIT 18109
#1402564440
unicorn -c ../config/unicorn.rb -E production -p 4000 
#1402564449
ls
#1402564449
pwd
#1402564453
unicorn -c ../config/unicorn.rb -E production -p 4000
#1402564466
unicorn -c config/unicorn.rb -E production -p 4000
#1402564511
unicorn  -E production -p 4000
#1402564552
unicorn  -E development -p 4000
#1402564615
RAILS_ENV=development bundle
#1402564625
unicorn  -E development -p 4000
#1402564898
RAILS_ENV=development rake db:migrate VERSION=0
#1402564941
mysql -u artem -pjU3dnBd9Js32g waprik_development < waprik_film
#1402564946
RAILS_ENV=development rake db:migrate
#1402564960
mysql -u artem -pjU3dnBd9Js32g waprik_development < waprik_films.sql
#1402564963
RAILS_ENV=development rake db:migrate
#1402564988
mysql -u artem -pjU3dnBd9Js32g 
#1402565026
RAILS_ENV=development rake db:migrate
#1402565046
mysql -u artem -pjU3dnBd9Js32g waprik_development < waprik_films.sql
#1402565057
RAILS_ENV=development rake db:migrate
#1402565071
unicorn  -E development -p 4000
#1402565117
rails c development
#1402565332
bundle update
#1402565364
gem install nokogiri
#1402565479
RAILS_ENV=development rake db:migrate
#1402565484
unicorn  -E development -p 4000
#1402565522
gem install httpclient
#1402565537
bundle update
#1402565576
unicorn  -E development -p 4000
#1402565629
unicorn
#1402566171
unicorn -c config/unicorn.rb -E production -p 4000
#1402566178
unicorn -c config/unicorn.rb -E production -p 4000 -D
#1402566290
gem install sequel
#1402566320
gem install mechanize
#1402566373
gem install rest-open-uri
#1402566382
rails c
#1402566434
rmv list
#1402566438
rvm list
#1402566457
rvm ruby-2.0.0-p0 --default
#1402566462
ruby -v
#1402566465
rails 
#1402566466
c
#1402566474
bundle installl
#1402566476
bundle install
#1402566498
rails c
#1402566645
git@github.com:pmisters/Kinopoisk.git
#1402566653
gem install git@github.com:pmisters/Kinopoisk.git
#1402566686
gem install https://github.com/pmisters/Kinopoisk.git
#1402566719
gem install kinopoisk
#1402566760
rails c
#1402566804
gem list
#1402566825
gem rm kinopoisk (0.0.3)
#1402566829
gem rm kinopoisk
#1402566833
gem --help
#1402566844
gem remove kinopoisk (
#1402566876
gem uninstall kinopoisk (0.0.3)
#1402566879
gem uninstall kinopoisk 
#1402566883
rails c
#1402566915
gem uninstall kinopoisk-parser
#1402566930
gem install kinopoisk
#1402566943
rails c
#1402566966
bundle update
#1402567347
gem install kinopoisk-purser
#1402567365
rails c
#1402567471
httpclient
#1402567485
httpclient
#1402567675
curl http://kinopoisk.ru
#1402567714
rails c
#1402568511
rails c
#1402568577
rails c
#1402568673
rails c
#1402568706
rails c
#1402568754
bundle update
#1402568790
lsof -wni tcp:4000
#1402568797
kill -QUIT 3511
#1402568825
unicorn -c config/unicorn.rb -p4000 -e production -D
#1402568839
unicorn -c config/unicorn.rb -e production -p 4000 -D
#1402568848
unicorn -c config/unicorn.rb -E production -p 4000 -D
#1402568892
lsof -wni tcp:4000
#1402568899
kill -QUIT 8740
#1402568907
unicorn -c config/unicorn.rb -E development -p 4000 -D
#1402569183
git commit -am 'remote'
#1402569191
git push waprik master
#1402569388
git pull waprik master
#1402569409
lsof -wni tcp:4000
#1402569416
kill -QUIT 9023
#1402569421
unicorn -c config/unicorn.rb -E development -p 4000 -D
#1402569462
unicorn -c config/unicorn.rb -E development -p 4000 -D
#1402569507
cd public/
#1402569508
ls
#1402569510
cd uploads/
#1402569510
ls
#1402569512
cd frp
#1402569513
ls
#1402569517
cd ftp
#1402569517
ls
#1402569539
cd ..
#1402569540
cd ..
#1402569558
mkdir ftp/films
#1402569565
mkdir -r ftp/films
#1402569572
mkdir ftp
#1402569575
mkdir ftp/films
#1402569619
mv ./uploads/ftp/Gran.Budushego.2014.D.CAMRip.1400MB.nnm-club.avi ./uploads/ftp/Ma1efisenta.2014.D.CAMRip.1400MB.avi ftp/films
#1402569640
top
#1402569664
q
#1402569667
cd .
#1402569668
cd ..
#1402569672
sidekiq
#1402570054
RAILS_ENV=production bundle update
#1402570078
rails c production
#1402570137
nano log/production.log 
#1402570244
nano log/production.log 
#1402570403
lsof -wni tcp:4000
#1402570408
kill -QUIT 11511
#1402570467
nano log/production.log 
#1402572134
ruby -v
#1402572196
stat /lib
#1402572199
cd lib
#1402572201
ls
#1402572205
cd /lib
#1402572206
ls
#1402572233
cd /usr/local/rvm/gems/ruby-2.1.2/bin/
#1402572235
ls
#1402572250
cd ..
#1402572251
cd ..
#1402572252
ls
#1402572259
cd ruby-2.0.0-p0
#1402572260
ls
#1402572265
cd gems
#1402572266
ls
#1402572278
rm -rf kinopoisk-0.0.3
#1402572283
cd kinopoisk_parser-2.0.1/
#1402572284
ls
#1402572289
cd lib/
#1402572290
ls
#1402572297
cd kinopoisk/
#1402572298
ls
#1402572305
nano search.rb 
#1402572319
cd ..
#1402572319
ls
#1402572326
nano kinopoisk_parser.rb 
#1402572371
rmv list
#1402572374
rvm list
#1402572395
rvm remove ruby-2.1.2
#1402572416
rails c
#1402572423
cd /home/waprik
#1402572424
ls
#1402572426
rails c
#1402572469
lsof -wni tcp:4000
#1402572475
kill -QUIT 15246
#1402572493
RAILS_ENV=production bundle update
#1402572518
unicorn -p 4000 -E development
#1402572546
unicorn -p 4000 -E production
#1402572575
unicorn -c config/unicorn.rb -p 4000 -E production -D
#1402572627
sudo service redis_6379 start
#1402572629
su
#1402572683
bundle exec sidekiq -d -e production
#1402572699
bundle exec sidekiq -d -e production -L sidekiq.log
#1402572753
top
#1402572788
nano sidekiq.log
#1402572885
top
#1402572916
nano sidekiq.log
#1402572949
top
#1402572985
cd public
#1402572986
ls
#1402572990
cd tmp
#1402572991
ls
#1402573009
stat Ma1efisenta.2014.D.CAMRip.1400MB.3gp
#1402573017
stat Ma1efisenta.2014.D.CAMRip.1400MB.avi.3gp
#1402573026
su -sh Ma1efisenta.2014.D.CAMRip.1400MB.avi.3gp
#1402573034
du -sh Ma1efisenta.2014.D.CAMRip.1400MB.avi.3gp
#1402573036
du -sh Ma1efisenta.2014.D.CAMRip.1400MB.avi.3gp
#1402573037
du -sh Ma1efisenta.2014.D.CAMRip.1400MB.avi.3gp
#1402573038
du -sh Ma1efisenta.2014.D.CAMRip.1400MB.avi.3gp
#1402573041
du -sh Ma1efisenta.2014.D.CAMRip.1400MB.avi.3gp
#1402573043
du -sh Ma1efisenta.2014.D.CAMRip.1400MB.avi.3gp
#1402573044
du -sh Ma1efisenta.2014.D.CAMRip.1400MB.avi.3gp
#1402573045
du -sh Ma1efisenta.2014.D.CAMRip.1400MB.avi.3gp
#1402573046
du -sh Ma1efisenta.2014.D.CAMRip.1400MB.avi.3gp
#1402573046
du -sh Ma1efisenta.2014.D.CAMRip.1400MB.avi.3gp
#1402573047
du -sh Ma1efisenta.2014.D.CAMRip.1400MB.avi.3gp
#1402573047
du -sh Ma1efisenta.2014.D.CAMRip.1400MB.avi.3gp
#1402573048
du -sh Ma1efisenta.2014.D.CAMRip.1400MB.avi.3gp
#1402573049
du -sh Ma1efisenta.2014.D.CAMRip.1400MB.avi.3gp
#1402573064
du -sh Ma1efisenta.2014.D.CAMRip.1400MB.avi_640.mp4
#1402573066
du -sh Ma1efisenta.2014.D.CAMRip.1400MB.avi_640.mp4
#1402573067
du -sh Ma1efisenta.2014.D.CAMRip.1400MB.avi_640.mp4
#1402573068
du -sh Ma1efisenta.2014.D.CAMRip.1400MB.avi_640.mp4
#1402573069
du -sh Ma1efisenta.2014.D.CAMRip.1400MB.avi_640.mp4
#1402573069
du -sh Ma1efisenta.2014.D.CAMRip.1400MB.avi_640.mp4
#1402573070
du -sh Ma1efisenta.2014.D.CAMRip.1400MB.avi_640.mp4
#1402573071
du -sh Ma1efisenta.2014.D.CAMRip.1400MB.avi_640.mp4
#1402573076
top
#1402573247
ls
#1402573250
cd ..
#1402573252
ls
#1402573276
cd uploads/
#1402573277
ls
#1402573280
cd films
#1402573280
ls
#1402573287
cd 1214
#1402573288
ls
#1402573294
cd 1214
#1402573302
cd ..
#1402573302
cd ..
#1402573303
cd ..
#1402573304
ls
#1402573308
nano sidekiq.log 
#1402573350
ls
#1402573356
pwd
#1402573363
stat public
#1402573369
stat public/uploads/
#1402573373
stat public/uploads/films
#1402573376
su
#1402573427
top
#1402573449
ls
#1402573452
nano sidekiq.log 
#1402573466
top
#1402573469
top
#1402573590
bundle exec sidekiq stop
#1402573603
top
#1402573658
rails c production
#1402573765
ещз
#1402573766
top
#1402573788
nano sidekiq.log 
#1402575905
nano sidekiq.log 
#1402575941
top
#1402576073
top
#1402576149
top
#1402577269
nano log/production.log 
#1402577370
git pull waprik master
#1402577407
nano app/controllers/admin/films_controller.rb 
#1402577467
lsof -wni tcp:4000
#1402577473
kill -QUIT 20480
#1402577474
ls
#1402577496
unicorn -p 4000 -E development
#1402577605
unicorn -p 4000 -E production
#1402577672
unicorn -c config/unicorn.rb -E production -p 4000
#1402577677
unicorn -c config/unicorn.rb -E production -p 4000 -D
#1402577873
git pull waprik master 
#1402577888
rm -rf tmp/cache/assets/D4E/1B0/sprockets%2Ff7cbd26ba1d28d48de824f0e94586655 tmp/cache/assets/E04/890/sprockets%2F2f5173deea6c795b8fdde723bb4b63af
#1402577891
git pull waprik master 
#1402578033
stat /uploads/films/1218/cover/cover.jpg
#1402578039
stat public/uploads/films/1218/cover/cover.jpg
#1402578044
stat public/uploads/films/1218/
#1402578050
stat /public/uploads/films/1218/
#1402578058
stat /public/uploads/films/1218
#1402578061
ls
#1402578067
stat/public/uploads/films/1218
#1402578073
stat public/uploads/films/1218
#1402578083
/uploads/films/1218/cover/cover.jpg
#1402578085
св /uploads/films/1218/cover/cover.jpg
#1402578087
cd /uploads/films/1218/cover/cover.jpg
#1402578096
cd uploads/films/
#1402578098
cd uploads/films
#1402578107
cd /public/uploads/films
#1402578112
cd public/uploads/films
#1402578113
ls
#1402578122
cd 1218
#1402578150
cd ..
#1402578153
stat films
#1402578197
cd ..
#1402578198
cd ..
#1402578203
nano log/production.log 
#1402578352
top
#1402579232
top
#1402640513
cd /home/waprik/public/ftp
#1402640514
ls
#1402640523
su
#1402769178
ls
#1402769186
git pull waprik master
#1402769210
git status
#1402769234
git checkout tmp
#1402769236
git status
#1402769242
git checkout tmp/*
#1402769245
git status
#1402769266
git commit -m 'gemfile'
#1402769273
git pull waprik master
#1402769287
git commit -am 'gemfile'
#1402769293
git pull waprik master
#1402769301
git pull waprik master
#1402769316
nano Gemfile
#1402769372
lsof -wni tcp:4000
#1402769379
kill -QUIT 30119
#1402769400
unicorn -c config/unicorn.rb -E production -p 4000 -D
#1402769412
pwd
#1402769433
nano log/production.log 
#1402769460
cd log
#1402769461
ls
#1402769467
cd ..
#1402769468
ls
#1402769479
cd config
#1402769482
nano unicorn.rb 
#1402769505
cd ..
#1402769509
unicorn -c config/unicorn.rb -E production -p 4000 -D
#1402769521
git status
#1402769526
unicorn
#1402769538
unicorn -p 4000
#1402769557
bundle install
#1402769574
unicorn -c config/unicorn.rb -E production -p 4000 -D
#1402769666
nano log/production.log 
#1402769710
lsof -wni tcp:4000
#1402769715
kill -QUIT 21745
#1402769729
unicorn -E production -p 4000
#1402769753
unicorn -E development -p 4000
#1402769863
git pull waprik master
#1402769871
unicorn -E production -p 4000
#1402769912
unicorn -E production -p 4000 -D
#1402769986
sidebundle exec sidekiq -d -L sidekiq.log -e production
#1402769992
bundle exec sidekiq -d -L sidekiq.log -e production
#1402770068
ещз
#1402770070
top
#1402770198
nano sidekiq.log 
#1402770246
top
#1402770268
cd public/
#1402770268
s
#1402770269
ls
#1402770271
cd ftp
#1402770272
ls
#1402770274
cd films
#1402770275
ld
#1402770277
ls
#1402770285
rm -rf Kuhnia.v.Parizhe.2014.O.HDRip.1.46Gb.avi 
#1402771412
ды
#1402771413
ls
#1402771421
cd ..
#1402771422
ls
#1402771429
stat Kuhnia.v.Parizhe.2014.O.HDRip.1.46Gb.avi 
#1402771719
stat Kuhnia.v.Parizhe.2014.O.HDRip.1.46Gb.avi 
#1402771728
stat Kuhnia.v.Parizhe.2014.O.HDRip.1.46Gb.avi 
#1402771735
stat Kuhnia.v.Parizhe.2014.O.HDRip.1.46Gb.avi 
#1402771741
stat Kuhnia.v.Parizhe.2014.O.HDRip.1.46Gb.avi 
#1402772102
stat Kuhnia.v.Parizhe.2014.O.HDRip.1.46Gb.avi 
#1402772113
mv Kuhnia.v.Parizhe.2014.O.HDRip.1.46Gb.avi films/
#1402772169
top
#1402774162
cd ..
#1402774163
cd ..
#1402774168
nano sidekiq.log 
#1402774645
top
#1402775266
nano app/workers/ffmpeg_worker.rb 
#1402775364
top
#1402775369
sidekiqctl stop
#1402775382
sidekiqctl stop #{rails_root}/tmp/pids/sidekiq_website_crawler.pid 60
#1402775399
cd tmp
#1402775400
ls
#1402775405
cd ..
#1402775435
sidekiq stop
#1402775457
top
#1402775557
git pull waprik master
#1402775579
lsof -wni tcp:4000
#1402775595
lsof -wni tcp:4000
#1402775600
kill -QUIT 22791
#1402775621
unicorn -c config/unicorn.rb -E production -p 4000 -D
#1402775669
bundle exec sidekiq -d -L sidekiq.log -q default -e production
#1402776177
cd public/ftp
#1402776178
ls
#1402776187
mv Sosedi.Na.Trope.Voyny.2014.D.CAMRip.1400MB.avi films
#1402776201
top
#1402801031
nano sidekiq.log 
#1402801298
top
pwd
rails c
exit