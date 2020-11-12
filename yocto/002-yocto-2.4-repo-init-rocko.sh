
mkdir ~/var-fslc-yocto-2.4-rocko
cd ~/var-fslc-yocto-2.4-rocko

if [ -d build_xwayland ]; then
   source setup-environment build_xwayland
else
   repo init -u https://github.com/varigit/variscite-bsp-platform -b rocko
   repo sync -j4
   MACHINE=imx8mm-var-dart DISTRO=fsl-imx-xwayland . var-setup-release.sh -b build_xwayland
fi
