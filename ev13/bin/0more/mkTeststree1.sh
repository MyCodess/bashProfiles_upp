#!/bin/bash
set -e

cd ${vaaruTestsDP} && pwd

rm -rf ./d1

mkdir -p d1/d11/d111
mkdir -p d1/d12/d121
mkdir -p d1/d13/d131
mkdir -p d1/d13/d132
mkdir -p d1/d13/d133
touch d1/d11/d111/f1
touch d1/d12/d121/f1
touch d1/d13/d133/f1
touch d1/d13/d131/f1
touch d1/d13/d132/f1

