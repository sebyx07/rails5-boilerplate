#!/bin/bash
rm tmp public/packs -rf
foreman start -d . -f Procfiledev
