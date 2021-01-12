#!/bin/sh

# Docker 环境
PROJECT_DIR_PATH=$(pwd)

# 切换到宿主机环境
# scp ${PROJECT_DIR_PATH} jlgl-ios@172.23.2.52:~/Documents/JenkinsContainer/
# ssh -tt jlgl-ios@172.23.2.52

# 宿主机环境项目信息
PROJECT_WORKSPACE_PATH="./Example"

PROJECT_DIR_PATH=$(pwd)
PROJECT_NAME=${PROJECT_DIR_PATH##*/}

POD_SPEC="${PROJECT_NAME}.podspec"
POD_SPEC_JSON="${PROJECT_NAME}.podspec.json"

POD_SPEC_PATH="${PROJECT_DIR_PATH}/${POD_SPEC}"
POD_SPEC_JSON_PATH="${PROJECT_DIR_PATH}/${POD_SPEC_JSON}"

# 项目信息(for Debug)
echo ""
echo "************** debug info ********************"
echo "PROJECT_WORKSPACE_PATH: ${PROJECT_WORKSPACE_PATH}"
echo "PROJECT_DIR_PATH: ${PROJECT_DIR_PATH}"
echo "PROJECT_NAME: ${PROJECT_NAME}"

echo "POD_SPEC: ${POD_SPEC}"
echo "POD_SPEC_JSON: ${POD_SPEC_JSON}"

echo "POD_SPEC_PATH: ${POD_SPEC_PATH}"
echo "POD_SPEC_JSON_PATH: ${POD_SPEC_JSON_PATH}"
echo "************** debug info *********************"


echo ""
echo "============= Do some prepare work =============="
git pull origin master
# cd ${PROJECT_WORKSPACE_PATH}
pod install
echo "================ work finished =================="

echo ""
echo "=============== clean workspace ==============="
xcodebuild -workspace "${PROJECT_NAME}.xcworkspace" -scheme "${PROJECT_NAME}"  -configuration 'Debug' clean

echo ""
echo "==================== build ===================="
# xcodebuild -workspace "${PROJECT_NAME}.xcworkspace" -scheme "${PROJECT_NAME}" -sdk iphoneos -configuration 'Debug' CODE_SIGN_IDENTITY="${CODE_SIGN_DISTRIBUTION}" SYMROOT='$(PWD)'
xcodebuild -workspace "${PROJECT_NAME}.xcworkspace" -scheme "${PROJECT_NAME}" -sdk iphoneos -configuration 'Debug' SYMROOT='$(PWD)'

echo ""
echo "==================== run ======================"
# xcrun -sdk iphoneos PackageApplication "./Release-iphoneos/${APP_NAME}.app" -o ~/"${IPANAME}"