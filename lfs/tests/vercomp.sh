#!/bin/bash

# taken from https://stackoverflow.com/questions/4023830/how-to-compare-two-strings-in-dot-separated-version-format-in-bash
vercomp () {
    if [[ $1 == $2 ]]
    then
        return 0
    fi
    local IFS=.
    local i ver1=($1) ver2=($2)
    # fill empty fields in ver1 with zeros
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++))
    do
        ver1[i]=0
    done
    for ((i=0; i<${#ver1[@]}; i++))
    do
        if [[ -z ${ver2[i]} ]]
        then
            # fill empty fields in ver2 with zeros
            ver2[i]=0
        fi
        if ((10#${ver1[i]} > 10#${ver2[i]}))
        then
            return 1
        fi
        if ((10#${ver1[i]} < 10#${ver2[i]}))
        then
            return 2
        fi
    done
    return 0
}

testvercomp () {
    vercomp $1 $2
    case $? in
        0) op='=';;
        1) op='>';;
        2) op='<';;
    esac
    if [[ $op != $3 ]]
    then
        echo "FAIL: Expected '$3', Actual '$op', Arg1 '$1', Arg2 '$2'"
    else
        echo "Pass: '$1 $op $2'"
    fi
}

# Run tests
# argument table format:
# testarg1   testarg2     expected_relationship
echo "The following tests should pass"
while read -r test
do
    testvercomp $test
done << EOF
1            1            =
2.1          2.2          <
3.0.4.10     3.0.4.2      >
4.08         4.08.01      <
3.2.1.9.8144 3.2          >
3.2          3.2.1.9.8144 <
1.2          2.1          <
2.1          1.2          >
5.6.7        5.6.7        =
1.01.1       1.1.1        =
1.1.1        1.01.1       =
1            1.0          =
1.0          1            =
1.0.2.0      1.0.2        =
1..0         1.0          =
1.0          1..0         =
EOF

echo "The following test should fail (test the tester)"
testvercomp 1 1 '>'

bison --version | head -n1
gcc --version | head -n1
g++ --version | head -n1
grep --version | head -n1
gzip --version | head -n1
cat /proc/version
m4 --version | head -n1
make --version | head -n1
patch --version | head -n1
echo Perl `perl -V:version`
python3 --version
sed --version | head -n1
tar --version | head -n1
makeinfo --version | head -n1  # texinfo version
xz --version | head -n1

# Required versions
GCCRequiredVer="4.8"
GPPRequiredVer="4.8"
GREPRequiredVer="2.5"
GZIPRequiredVer="1.3"
M4RequiredVer="5.0.0"
# Launching tests
echo -e '###### TESTS ######\nLaunching tests ...\n---------------------'

# GCC
GCCCurrentVer="$(gcc --version | head -n1 | cut -d" " -f4)"
if [ "$(printf '%s\n' "$GCCRequiredVer" "$GCCCurrentVer" | sort -V | head -n1)" > "$GCCRequiredVer" ]; then 
    echo "gcc required version -> ${GCCRequiredVer} [OK]"
else
    echo "gcc Required version -> ${GCCRequiredVer} [FALSE]"
fi
# GPP
GPPurrentVer="$(g++ --version | head -n1 | cut -d" " -f4)"
if [ "$(printf '%s\n' "$GPPRequiredVer" "$GPPCurrentVer" | sort -V | head -n1)" > "$GPPRequiredVer" ]; then 
    echo "g++ required version -> ${GPPRequiredVer} [OK]"
else
    echo "g++ Required version -> ${GPPRequiredVer} [FALSE]"
fi

# GREP
GREPCurrentVer="$(grep --version | head -n1 | cut -d" " -f4)"
if [ "$(printf '%s\n' "$GREPRequiredVer" "$GREPCurrentVer" | sort -V | head -n1)" > "$GREPRequiredVer" ]; then 
    echo "grep required version -> ${GREPRequiredVer} [OK]"
else
    echo "grep Required version -> ${GREPRequiredVer} [FALSE]"
fi

# GZIP
GZIPCurrentVer="$(gzip --version | head -n1 | cut -d" " -f4)"
if [ "$(printf '%s\n' "$GZIPRequiredVer" "$GZIPCurrentVer" | sort -V | head -n1)" > "$GZIPRequiredVer" ]; then 
    echo "gzip required version -> ${GZIPRequiredVer} [OK]"
else
    echo "gzip Required version -> ${GZIPRequiredVer} [FALSE]"
fi

# M4
M4CurrentVer="$(m4 --version | head -n1 | cut -d" " -f4)"
M4RequiredVer="5.0.0"
if [ "$(printf '%s\n' "$M4RequiredVer" "$M4CurrentVer" | sort -V | head -n1)" > "$M4RequiredVer" ]; then 
    echo "M4 required version -> ${M4RequiredVer} [OK]"
else
    echo "M4 Required version -> ${M4RequiredVer} [FALSE]"
fi

# make
MAKECurrentVer="$(make --version | head -n1 | cut -d" " -f4)"
MAKERequiredVer="5.0.0"
if [ "$(printf '%s\n' "$MAKERequiredVer" "$MAKECurrentVer" | sort -V | head -n1)" > "$MAKERequiredVer" ]; then 
    echo "make required version -> ${MAKERequiredVer} [OK]"
else
    echo "make Required version -> ${MAKERequiredVer} [FALSE]"
fi

# patch
PATCHCurrentVer="$(patch --version | head -n1 | cut -d" " -f4)"
PATCHRequiredVer="5.0.0"
if [ "$(printf '%s\n' "$PATCHRequiredVer" "$PATCHCurrentVer" | sort -V | head -n1)" > "$PATCHRequiredVer" ]; then 
    echo "patch required version -> ${PATCHRequiredVer} [OK]"
else
    echo "patch Required version -> ${PATCHRequiredVer} [FALSE]"
fi

# sed
SEDCurrentVer="$(python3 --version | head -n1 | cut -d" " -f4)"
SEDRequiredVer="5.0.0"
if [ "$(printf '%s\n' "$SEDRequiredVer" "$SEDCurrentVer" | sort -V | head -n1)" > "$SEDRequiredVer" ]; then 
    echo "make required version -> ${SEDRequiredVer} [OK]"
else
    echo "make Required version -> ${SEDRequiredVer} [FALSE]"
fi