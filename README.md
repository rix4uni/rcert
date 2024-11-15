## rcert
Recursive subdomain enumeration of Certificate_Subject_Alternative_Name using `certinfo`

## Prerequisites
```
go install github.com/rix4uni/certinfo@latest
go install -v github.com/rix4uni/unew@latest
```

## Installation
```
git clone https://github.com/rix4uni/rcert.git
cd rcert
chmod +x rcert
mv rcert /usr/bin/
```

## Usage
Single Domain:
```
rcert -d google.com
```

Multiple Domains:
```
rcert -list domains.txt
```

## Comparison why `rcert` useful
```
▶ echo "xapi.stg.xfinity.com" | certinfo -silent | wc -l
69
```

```
▶ rcert -d xapi.stg.xfinity.com | wc -l
130
```