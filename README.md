# rcert
Recursive Certificate_Subject_Alternative_Name Scan

This tool Recursively scans Certificate_Subject_Alternative_Name domain using `certinfo` and prints only unique output and also saves output in a given the domain name $DOMAIN.txt like this `google.com.txt`

## Installation
```
git clone https://github.com/rix4uni/rcert.git
cd rcert && chmod +x rcert.sh
```

## Usage
Single Domain:
```
bash rcert.sh google.com
```

Multiple Domains:
```
bash rcert.sh domains.txt
```
