Using FaultMap docker image on Ubuntu (inside VirtualBox on Windows Server 2008 R2)

Getting the image

sudo docker pull simonstreicher/faultmap

Create a shared folder between your host machine and the Ubuntu guest VM in Virtualbox. The default location for accessing this inside the Ubuntu guest is /media/sf_shared.

Copy the config.json file found in the FaultMapDocker repo on Github into the shared folder together with your raw data folder. You may need to edit the config file to  match the specific details of your VM.

Run the docker image in interactive mode, mount the shared directory as a volume and open a bash shell with the following command:

sudo docker run -t -i  -v /media/sf_shared:/opt/faultmap_data simonstreicher/faultmap /bin/bash

Copy the config.json file into the faultmap repo directory:

cp /opt/faultmap_data/config.json /repos/faultmap

Now you can run the FaultMap command as follows, for example:
python /repos/faultmap/run_weightcalc.py







