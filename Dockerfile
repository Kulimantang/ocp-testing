# Adding first layer: Parent Image
# This will pull the Image from Dockerhub if we haven't downloaded it or own computer
FROM node:17-alpine


# specifies the working directory of the application
WORKDIR /app


COPY package.json .

RUN npm install 

# Copying our Sourcecode into the image:
# first dot: path of relative directory we want to copy from (. = current directory) // Second dot: path of the image where we want to copy the source code to (. = copy into root directory - '/app' would create new folder and copy into the folder 'app') --> when we specify WORKDIR we can type '.' again and it will compy in /app
COPY . .

# next layer: all the dependencies we need to install on the image
# specifiy commands that we want to run in the image at build time (with RUN) (needs to be run inside the directory of the package.json file --> it will because we specified the WORKDIR)


# Tell Docker which port should be exposed by the container:
# only necessary when using Docker Desktop?!
# not really needed from the commandline
EXPOSE 8080

# add command to run Application inside container (not with RUN command, since RUN refers to commands running at build time) --> CMD Command: specifies Commands that are executed at runtime, when the conatainer begins to run
CMD ["node", "app.js"]
