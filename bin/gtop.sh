#!/bin/bash

cd $(git rev-parse --show-superproject-working-tree --show-toplevel | head -1)
