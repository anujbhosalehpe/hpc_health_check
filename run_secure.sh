#!/bin/bash

REPO_URL="https://github.com/anujbhosalehpe/hpc_health_check.git"
WORKDIR="/tmp/healthcheck_run"
BRANCH="main"

echo "Creating working directory..."
rm -rf $WORKDIR
git clone -b $BRANCH $REPO_URL $WORKDIR

chmod -R 755 $WORKDIR

cd $WORKDIR || exit 1

echo "Running health check..."
sh main_health_check.sh

cd || exit 1

echo "Cleaning sensitive files..."
rm -rf $WORKDIR

echo "Health check completed."
echo "Output folder retained."
