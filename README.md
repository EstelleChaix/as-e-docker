# uc-tdm-AS-E-docker

Docker for the OpenMinTeD AS-E use case

To run the AS-E workflow with a local corpus :
 
  sudo docker run -i --rm -v $PWD/:/as-e/data as-e-docker alvisnlp -verbose \
  -alias readPubMed /as-e/data/alvisir2_corpus/pubmed_result_2.xml \
  -alias readhtml /as-e/data/alvisir2_corpus/fulltext/html \
  -alias readWoK /as-e/data/alvisir2_corpus/corpus2000_12012017.txt \
  -alias exportDocument \"sectionsWOKPubMed.txt\" \
  -alias output_fixed_relations \"relationsgroup.txt\" \
  -alias output_fixed_entities \"entities.txt\" \
  -outputDir /as-e/data/  \
  /as-e/plan/entities.plan


#-entity inputfile /path/on/the/container1/inputfilename -entity outdir /path/on/the/container2 plans/tag_WoS_abstracts.plan```



# Memo
sudo docker run -i --rm -v /home/echaix/Documents/OpenMinTeD/alvisir2_corpus:/alvisir2_corpus -v /home/echaix/Documents/OpenMinTeD/output:/as-e/output as-e-docker alvisnlp -J "-Xmx30g" -verbose -log output/alvisnlp.log plan/entities.plan 
 


construire :  sudo docker build -t as-e-docker .
effacer :  sudo docker rm $(sudo docker ps -a -q) 
effacer image spe: sudo docker rmi as-e-docker


