Using FaultMap docker image on Ubuntu (running on AWS EC2)

Getting the image
sudo docker pull simonstreicher/faultmap

You will need to setup a folder containing data, results, and configs subdirectories on your Ubuntu machine and adjust the config.json file accordingly.

I successfully used Dropbox (together with selective sync) to setup folders that allows syncing in the background between containers running on different instances.

Run the docker image in interactive mode, mount the shared directory as a volume and open a bash shell with the following command:

docker run -t -i -v ~/Dropbox/faultmap:/opt/ simonstreicher/faultmap /bin/bash

Copy the config.json file into the faultmap repo directory:

cp /opt/faultmap_configs/config.json /repos/faultmap

Now you can run the FaultMap WeightCalc command as follows:

cd /repos/faultmap
python run_weightcalc.py







