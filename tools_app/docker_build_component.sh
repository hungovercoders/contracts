set -e  # Exit immediately if a command exits with a non-zero status.

APP_TYPE=${1}
RUN=${2:-False}
PUSH=${3:-False}

set -a
. ./domain.env
set +a
echo -e "${MESSAGE_COLOUR}Starting script: $0...${MESSAGE_NO_COLOUR}"

if [ $RUN = True ]; then
    echo "You have chosen to run the image as a container once built."
fi
if [ $RUN = False ]; then
    echo "You have chosen not to run the image as a container once built."
fi

if [ $PUSH = True ]; then
    echo "You have chosen to push the image once built, run and tested."
fi
if [ $PUSH = False ]; then
    echo "You have chosen not to push the image once built, run and tested."
fi

if [ "$APP_TYPE" = "api" ]; then
    echo "You have chosen to build an API."
    PORT1="$PORT_API"
    PORT2="$PORT_API"
fi
if [ "$APP_TYPE" = "web" ]; then
    echo "You have chosen to build a web page."
    PORT1="$PORT_WEB" ##"8080"
    PORT2="$PORT_WEB"
fi

echo "Port1 is $PORT1."
echo "Port2 is $PORT2."
echo "Organisation is $ORGANISATION."
echo "App name is $APP."
echo "App type is $APP_TYPE."
CONTAINERNAME=$APP-$APP_TYPE
echo "Container name is $CONTAINERNAME."
BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo "Branch is $BRANCH."
if [ -n "$(git status --porcelain)" ]; then
    echo "Uncommitted changes so image tag is..."
    IMAGE_TAG="$BRANCH-development"
else
    echo "All changes committed so image tag is..."
    COMMIT_ID=$(git log -1 --format="%h")
    IMAGE_TAG="$BRANCH-$COMMIT_ID"
fi
if [ $GITHUB_ACTION ]; then
    echo "This is a github action deployment..."
    echo "Image tag is correct."
else
    echo "This is not a github action deployment..."
    echo "Updating image tag if not already development..."
    echo "Image tag is $IMAGE_TAG."
    if [ -n "$(echo "$IMAGE_TAG" | grep "development")" ];  then
        echo "Image tag already development so do nothing."
    else
        IMAGE_TAG="$IMAGE_TAG-development"
        echo "Updated image tag."
    fi
fi
echo "Final image tag is $IMAGE_TAG."
IMAGENAME=$ORGANISATION/$APP-$APP_TYPE:$IMAGE_TAG
echo "Image name is $IMAGENAME."

echo "Changing to application directory to interact with docker file..."
cd $APP_TYPE
echo "Changed to application directory to interact with docker file."
echo "Building $IMAGENAME..."
docker build -t $IMAGENAME .
echo "Built $IMAGENAME."
echo "Changing to back to root directory..."
cd ..
echo "Changed to back to root directory."


if [ "$(docker inspect -f '{{.State.Running}}' "$CONTAINERNAME" 2>/dev/null)" = "true" ]; then
    echo "Stopping container: $CONTAINERNAME"
    docker stop $CONTAINERNAME
    echo "Container stopped successfully."
else
    echo "Container $CONTAINERNAME is not currently running."
fi

if [ "$RUN" = "True" ] || [ "$PUSH" = "True" ]; then
    sh ./tools_app/docker_containers_clear.sh
    echo "Run container $CONTAINERNAME from image $IMAGENAME..."
    docker run -d --env-file domain.env -p $PORT1:$PORT2 --name $CONTAINERNAME -e ASPNETCORE_ENVIRONMENT=$ENVIRONMENT $IMAGENAME
    echo "Running container $CONTAINERNAME from image $IMAGENAME."
    sh ./test/tests.sh    
fi

if [ $PUSH = True ]; then
    echo "Logging in to Docker..."
    docker login --username $DOCKER_USERNAME --password $DOCKER_PASSWORD ##--password-stdin - how to use?
    echo "Logged in to Docker."
    echo "Pushing image $IMAGENAME..."
    docker push $IMAGENAME
    echo "Pushed image $IMAGENAME."
fi

echo -e "${MESSAGE_COLOUR}Completed script: $0.${MESSAGE_NO_COLOUR}"