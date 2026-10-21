rm /docker/zensical-build/page -rf 
cp /docker/zensical/docs/ /docker/zensical-build/page/ -r
rm /docker/zensical-build/page/site/ -rf
docker compose up
scp -r /docker/zensical-build/page/site/* root@gateway.nox.kiwi:/var/www/docs.eurokeep.io/
