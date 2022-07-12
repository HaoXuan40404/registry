vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO chfast/ethash
    REF 4576af36f8ebb9bee2d5f04be692f295c64a7211
    SHA512 967cc116f1eb12a93643171cb422804631bf8794f3c0228004c90defacce50d6fd927f0e5864f70207577b3756df187fc343ab729adeba1a3a0940230f9e8c99
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH} OPTIONS -DETHASH_BUILD_ETHASH=OFF -DETHASH_BUILD_TESTS=OFF -DHUNTER_ENABLED=OFF)
vcpkg_cmake_build()
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH /lib/cmake/ethash)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)