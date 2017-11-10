# uc-tdm-AS-E-docker

Docker for the OpenMinTeD AS-E use case

To run the AS-E workflow with a local corpus :

```sudo docker run -i --rm -v /path/to/local/corpus:/path/on/the/container1 -v /path/to/where/you/want/the/output:/path/on/the/container2 openminted/uc-tdm-AS-E/docker alvisnlp -J "-Xmx30g" -verbose -log plan/alvisnlp.log plan/entities.plan

#-entity inputfile /path/on/the/container1/inputfilename -entity outdir /path/on/the/container2 plans/tag_WoS_abstracts.plan```



 sudo docker run -i --rm -v /home/echaix/Documents/OpenMinTeD/alvisir2_corpus:/alvisir2_corpus -v /home/echaix/Documents/OpenMinTeD/output:/as-e/output as-e-docker alvisnlp -J "-Xmx30g" -verbose -log output/alvisnlp.log plan/entities.plan 




construire :  sudo docker build -t as-e-docker .
effacer :  sudo docker rm $(sudo docker ps -a -q) 
effacer image spe: sudo docker rmi as-e-docker


