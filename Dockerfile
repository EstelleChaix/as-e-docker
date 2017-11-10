# Pull AlvisNLP image
FROM bibliome/alvisengine:2.0.1
WORKDIR /alvisnlp
#RUN wget https://github.com/GNOME/gnumeric/archive/master.zip && \
#	unzip master.zip && \
#	cd gnumeric-master &&\
#	chmod +x ./configure.ac && \
#	./configure.ac && make && make install 
RUN apt-get -yqq update && apt-get install -yqq gnumeric curl \
	libglib2.0-bin\
	libgtk-3-dev \
	libgsf-1-dev\
	libgoffice-0.10-10\
	libxml2-dev\
	libpango1.0-dev\
	gsettings-desktop-schemas &&\
	apt-get clean && \
	rm -rf /var/lib/apt/lists* 

#RECUPERE AlvisIR
WORKDIR /alvisnlp
RUN git clone https://github.com/Bibliome/alvisir
WORKDIR /alvisnlp/alvisir
RUN mvn clean package
RUN ./install.sh /alvisnlp/alvisir/install
ENV PATH /alvisnlp/alvisir/install/bin:$PATH

# Set the working directory to /as-d
WORKDIR /as-e

# Copy AS-D workflows
#COPY plans /as-d/plans/

# Get resources from Agroportal
#WORKDIR /as-d/resources
#RUN wget http://data.agroportal.lirmm.fr/ontologies/WHEATPHENOTYPE/submissions/4/download?apikey=1de0a270-29c5-4dda-b043-7c3580628cd5 -O WheatPhenotypeOntology.obo
    
# Get resources from the OMTD uc-tdm-AS-D repository
RUN wget https://github.com/openminted/uc-tdm-AS-E/archive/master.zip && \
    unzip master.zip && \
    cp -r uc-tdm-AS-E-master/configuration/ /as-e/ && \
ls configuration &&\
mkdir /as-e/resources/ && \
    cp uc-tdm-AS-E-master/resources/* /as-e/resources && \
#    cp uc-tdm-AS-E-master/yatea.dtd /as-e/ && \
mkdir /as-e/plan/ && \
    cp uc-tdm-AS-E-master/plan/* /as-e/plan/ && \
    cp uc-tdm-AS-E-master/Licence /as-e/Licence && \
    cp uc-tdm-AS-E-master/Execution_resources.sh /as-e/Execution_resources.sh && \
chmod +x Execution_resources.sh && \
    cp uc-tdm-AS-E-master/README.md /as-e/README.md && \
    rm -r uc-tdm-AS-E-master 

# Preprocess resources
WORKDIR /as-e
#RUN DISPLAY=:0 gsettings set org.gnome.desktop.interface scrollbar-mode normal && ./Execution_resources.sh
RUN export $(dbus-launch) && ./Execution_resources.sh && \
ls -l resources







