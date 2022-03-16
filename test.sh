#!/bin/bash

ESC=$(printf '\033')

assert() {
    expected="$1"
    input="$2"

    ./acc "$input" > tmp.s
    cc -o tmp tmp.s
    ./tmp
    actual="$?"
    
    if [ "$actual" = "$expected" ]; then
        printf "${ESC}[32m%s${ESC}[m\n" "OK: $input => $actual"

    else
        printf "${ESC}[32m%s${ESC}[m\n" "Failed: $input => expected $expected, but $actual"
        echo "[tmp.s]"
        cat tmp.s
        exit 1
    fi
}

assert 0 0
assert 42 42
echo All tests OK.
