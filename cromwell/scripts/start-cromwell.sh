#!/bin/bash
#NOTE: change pathes according to your layout
/pipelines/cromwell/cromwell.sc server /pipelines/cromwell/application.conf /pipelines/cromwell/cromwell.jar /pipelines
echo "started cromwell service"
