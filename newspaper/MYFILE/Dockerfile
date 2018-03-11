FROM ubuntu:16.04

#ubuntu setup
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y build-essential
RUN apt-get install -y git
RUN apt-get install -y unzip
RUN apt-get install -y wget
RUN apt-get install -y linux-tools-common
RUN apt-get install -y linux-tools-generic
RUN apt-get install -y python-pip
RUN pip install matplotlib

#pmu_tools
RUN git clone https://github.com/andikleen/pmu-tools
WORKDIR pmu-tools
RUN export PATH=$PATH:`pwd`

#clone into newspaper
RUN git clone https://github.com/codelucas/newspaper
RUN cd newspaper
WORKDIR newspaper

