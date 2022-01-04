# CFE Builder
Used to build CFE for the Nemo (AmigaOne X1000) motherboard.

## Usage
Assuming you have the CFE sources in your current directory on some amd64 machine with Docker installed:
```
% docker run --rm -it --name cfe-build -v $PWD:/opt/code -w /opt/code ssolie/cfe-nemo-builder make -C build/varisys/nemo clean
% docker run --rm -it --name cfe-build -v $PWD:/opt/code -w /opt/code ssolie/cfe-nemo-builder make -C build/varisys/nemo
```
