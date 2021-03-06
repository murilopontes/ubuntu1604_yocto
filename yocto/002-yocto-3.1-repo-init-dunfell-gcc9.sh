

mkdir ~/var-fslc-yocto-3.1-dunfell
cd ~/var-fslc-yocto-3.1-dunfell

if [ -d build_xwayland ]; then
   source setup-environment build_xwayland
else
   repo init -u https://github.com/varigit/variscite-bsp-platform -b dunfell
   repo sync -j4
   MACHINE=imx8mm-var-dart DISTRO=fslc-x11 . setup-environment build_xwayland
fi


bitbake-layers show-recipes "*-image-*"
bitbake-layers show-recipes "*gcc*"
bitbake-layers show-layers
bitbake fsl-image-gui
bitbake fsl-image-gui -c populate_sdk

