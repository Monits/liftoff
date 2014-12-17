GIT=$(sh /etc/profile; which git)
GIT_RELEASE_VERSION=$(${GIT} describe --tags --always --abbrev=0)
COMMITS=$(${GIT} rev-list HEAD | wc -l)
COMMITS=$(($COMMITS))

/usr/libexec/PlistBuddy -c "Set :CFBundleVersion ${COMMITS}" "${TARGET_BUILD_DIR}/${INFOPLIST_PATH}"
/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString ${GIT_RELEASE_VERSION#*v}" "${TARGET_BUILD_DIR}/${INFOPLIST_PATH}"

echo "Updated ${TARGET_BUILD_DIR}/${INFOPLIST_PATH}"
